module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o, Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o, MemtoReg_o );
     
//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output			RegDst_o;
output			Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o, MemtoReg_o;
 
//Internal Signals
wire	[3-1:0] ALUOp_o;
wire			ALUSrc_o;
wire			RegWrite_o;
wire			RegDst_o;
wire			Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o, MemtoReg_o;

//Main function
/*your code here*/
reg [3-1:0] fALUOp_o;
reg fALUSrc_o;
reg fRegWrite_o;
reg fRegDst_o;	//fake output
reg fJump_o, fBranch_o, fBranchType_o, fMemWrite_o, fMemRead_o, fMemtoReg_o;
always@(instr_op_i) begin
	case(instr_op_i)
		6'b000000: begin fALUOp_o <= 2; fALUSrc_o <= 0; fRegWrite_o <= 1; fRegDst_o <= 1;
			 	 fJump_o <= 0; fBranch_o <= 0; fBranchType_o <= 0; fMemWrite_o <= 0; fMemRead_o <= 0; fMemtoReg_o <= 0; 
			   end	//R-type
		6'b001000: begin fALUOp_o <= 4; fALUSrc_o <= 1; fRegWrite_o <= 1; fRegDst_o <= 0; 
				 fJump_o <= 0; fBranch_o <= 0; fBranchType_o <= 0; fMemWrite_o <= 0; fMemRead_o <= 0; fMemtoReg_o <= 0;
			   end	//addi
		6'b011110: begin fALUOp_o <= 0; fALUSrc_o <= 1; fRegWrite_o <= 1; fRegDst_o <= 0;
			 	 fJump_o <= 0; fBranch_o <= 0; fBranchType_o <= 0; fMemWrite_o <= 0; fMemRead_o <= 1; fMemtoReg_o <= 1; 
			   end	//lw
		6'b011100: begin fALUOp_o <= 0; fALUSrc_o <= 1; fRegWrite_o <= 0; fRegDst_o <= 0;
			 	 fJump_o <= 0; fBranch_o <= 0; fBranchType_o <= 0; fMemWrite_o <= 1; fMemRead_o <= 0; fMemtoReg_o <= 0; 
			   end	//sw
		6'b000100: begin fALUOp_o <= 1; fALUSrc_o <= 0; fRegWrite_o <= 0; fRegDst_o <= 0;
			 	 fJump_o <= 0; fBranch_o <= 1; fBranchType_o <= 0; fMemWrite_o <= 0; fMemRead_o <= 0; fMemtoReg_o <= 0; 
			   end	//beq
		6'b011010: begin fALUOp_o <= 6; fALUSrc_o <= 0; fRegWrite_o <= 0; fRegDst_o <= 0;
			 	 fJump_o <= 0; fBranch_o <= 1; fBranchType_o <= 1; fMemWrite_o <= 0; fMemRead_o <= 0; fMemtoReg_o <= 0; 
			   end	//bne
		6'b011101: begin fALUOp_o <= 0; fALUSrc_o <= 0; fRegWrite_o <= 0; fRegDst_o <= 0;
			 	 fJump_o <= 1; fBranch_o <= 0; fBranchType_o <= 0; fMemWrite_o <= 0; fMemRead_o <= 0; fMemtoReg_o <= 0; 
			   end	//jump
	endcase
end
assign ALUOp_o = fALUOp_o;
assign ALUSrc_o = fALUSrc_o;
assign RegWrite_o = fRegWrite_o;
assign RegDst_o = fRegDst_o;
assign Jump_o = fJump_o;
assign Branch_o = fBranch_o;
assign BranchType_o = fBranchType_o;
assign MemWrite_o = fMemWrite_o;
assign MemRead_o = fMemRead_o;
assign MemtoReg_o = fMemtoReg_o;
endmodule



   