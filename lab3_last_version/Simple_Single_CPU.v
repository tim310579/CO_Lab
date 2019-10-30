module Simple_Single_CPU( clk_i, rst_n );

//I/O port
input         clk_i;
input         rst_n;

//Internal Signles
wire [32-1:0] instr, wD, rD1, rD2, ALU_result, Shifter_result;
wire RegDst, RegWrite, ALUSrc;
wire [2:0] ALUOP;


//modules

wire [31:0] pc_now, pc_after;
Program_Counter PC(
        .clk_i(clk_i),      
	    .rst_n(rst_n),     
	    .pc_in_i(pc_after) ,   
	    .pc_out_o(pc_now) 
	    );
	
Adder Adder1(
        .src1_i(pc_now),     
	    .src2_i(32'b00000000000000000000000000000100),
	    .sum_o(pc_after)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_now),  
	    .instr_o(instr)    
	    );

wire [4:0] wR_addr;

Mux2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr[20:16]),
        .data1_i(instr[15:11]),
        .select_i(RegDst),
        .data_o(wR_addr)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i(instr[25:21]) ,  
        .RTaddr_i(instr[20:16]) ,  
        .RDaddr_i(wR_addr) ,  
        .RDdata_i(wD)  , 
        .RegWrite_i(RegWrite),
        .RSdata_o(rD1) ,  
        .RTdata_o(rD2)   
        );
	
Decoder Decoder(
        .instr_op_i(instr[31:26]), 
	    .RegWrite_o(RegWrite), 
	    .ALUOp_o(ALUOP),   
	    .ALUSrc_o(ALUSrc),   
	    .RegDst_o(RegDst)   
		);

wire [4:0] ALU_op;
wire [1:0] FURslt;
wire lR;
ALU_Ctrl AC(
        .funct_i(instr[5:0]),   
        .ALUOp_i(ALUOP),   
        .ALU_operation_o(ALU_op),
	.leftRight_o(lR),
		.FURslt_o(FURslt)
        );
wire [31:0] sign_Extend;

Sign_Extend SE(
        .data_i(instr[15:0]),
        .data_o(sign_Extend)
        );

wire [31:0] zero_Filled;

Zero_Filled ZF(
        .data_i(instr[15:0]),
        .data_o(zero_Filled)
        );

wire [31:0] ALUinp2;
	
Mux2to1 #(.size(32)) ALU_src2Src(
        .data0_i(rD2),
        .data1_i(sign_Extend),
        .select_i(ALUSrc),
        .data_o(ALUinp2)
        );	
		
ALU ALU(
		.aluSrc1(rD1),
	    .aluSrc2(ALUinp2),
	    .ALU_operation_i(ALU_op),
		.result(ALU_result),
		.zero(),
		.overflow()
	    );
wire [5-1:0] shift_amt;
		

Shifter shifter( 
		.result(Shifter_result), 
		.leftRight(lR),
		.shamt(instr[10:6]),
		.sftSrc(ALUinp2) 
		);
		
Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(ALU_result),
        .data1_i(Shifter_result),
		.data2_i(zero_Filled),
        .select_i(FURslt),
        .data_o(wD)
        );			

endmodule
