module EX_MEM (clk_i, rst_n, RegWrite_i, MemtoReg_i, Branch_i, MemRead_i, MemWrite_i, pc_after_branch_i, Beq_or_Bne_i, ALU_Shifter_result_i, readData2_i, writeReg_addr_i, instruction_i,
	RegWrite_o, MemtoReg_o, Branch_o, MemRead_o, MemWrite_o, pc_after_branch_o, Beq_or_Bne_o, ALU_Shifter_result_o, readData2_o, writeReg_addr_o, instruction_o
);

input clk_i, rst_n;
input RegWrite_i, MemtoReg_i, Branch_i, MemRead_i, MemWrite_i, Beq_or_Bne_i;
input [31:0] pc_after_branch_i, ALU_Shifter_result_i, readData2_i, instruction_i;
input [4:0] writeReg_addr_i;

output reg RegWrite_o, MemtoReg_o, Branch_o, MemRead_o, MemWrite_o, Beq_or_Bne_o;
output reg [31:0] pc_after_branch_o, ALU_Shifter_result_o, readData2_o, instruction_o;
output reg [4:0] writeReg_addr_o;

always@(posedge clk_i or negedge rst_n)
begin
	if(rst_n == 0)
	begin
		RegWrite_o <= 1'd0;
		MemtoReg_o <= 1'd0;
		Branch_o <= 1'd0;
		MemRead_o <= 1'd0;
		MemWrite_o <= 1'd0;
		pc_after_branch_o <= 32'd0;
		Beq_or_Bne_o <= 1'd0;
		ALU_Shifter_result_o <= 32'd0;
		readData2_o <= 32'd0;
		writeReg_addr_o <= 5'd0;
		instruction_o <= 32'd0;
		
	end
	else
	begin
		RegWrite_o <= RegWrite_i;
		MemtoReg_o <= MemtoReg_i;
		Branch_o <= Branch_i;
		MemRead_o <= MemRead_i;
		MemWrite_o <= MemWrite_i;
		pc_after_branch_o <= pc_after_branch_i;
		Beq_or_Bne_o <= Beq_or_Bne_i;
		ALU_Shifter_result_o <= ALU_Shifter_result_i;
		readData2_o <= readData2_i;
		writeReg_addr_o <= writeReg_addr_i;
		instruction_o <= instruction_i;
		
	end
end
endmodule
