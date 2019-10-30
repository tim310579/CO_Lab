module ID_EX (clk_i, rst_n, MemtoReg_i, MemRead_i, MemWrite_i, Branch_i, RegWrite_i, BranchType_i, RegDst_i,
	ALUOP_i, ALUSrc_i, pc_i, readData1_i, readData2_i, sign_extend_i, zero_filled_i, instruction_i,
	MemtoReg_o, MemRead_o, MemWrite_o, Branch_o, RegWrite_o, BranchType_o, RegDst_o,
        ALUOP_o, ALUSrc_o, pc_o, readData1_o, readData2_o, sign_extend_o, zero_filled_o, instruction_o
);

input clk_i, rst_n;
input MemtoReg_i, MemRead_i, MemWrite_i, Branch_i, RegWrite_i, BranchType_i, RegDst_i, ALUSrc_i;
input [2:0] ALUOP_i;
input [31:0] pc_i, readData1_i, readData2_i, sign_extend_i, zero_filled_i, instruction_i;

output reg MemtoReg_o, MemRead_o, MemWrite_o, Branch_o, RegWrite_o, BranchType_o, RegDst_o, ALUSrc_o;
output reg [2:0] ALUOP_o;
output reg [31:0] pc_o, readData1_o, readData2_o, sign_extend_o, zero_filled_o, instruction_o;

always@(posedge clk_i, negedge rst_n)
begin
	if(rst_n == 0)
	begin
		MemtoReg_o <= 1'd0;
		MemRead_o <= 1'd0;
		MemWrite_o <= 1'd0;
		Branch_o <= 1'd0;
		RegWrite_o <= 1'd0;
		BranchType_o <= 1'd0;
		RegDst_o <= 1'd0;
		ALUOP_o <= 3'd0;
		ALUSrc_o <= 1'd0;
		pc_o <= 32'd0;
		readData1_o <= 32'd0;
		readData2_o <= 32'd0;
		sign_extend_o <= 32'd0;
		zero_filled_o <= 32'd0;
		instruction_o <= 32'd0;
		
	end
	else
	begin
		MemtoReg_o <= MemtoReg_i;
		MemRead_o <= MemRead_i;
		MemWrite_o <= MemWrite_i;
		Branch_o <= Branch_i;
		RegWrite_o <= RegWrite_i;
		BranchType_o <= BranchType_i;
		RegDst_o <= RegDst_i;
		ALUOP_o <= ALUOP_i;
		ALUSrc_o <= ALUSrc_i;
		pc_o <= pc_i;
		readData1_o <= readData1_i;
		readData2_o <= readData2_i;
		sign_extend_o <= sign_extend_i;
		zero_filled_o <= zero_filled_i;
		instruction_o <= instruction_i;
		
	end
end

endmodule     
