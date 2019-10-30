module Forwarding(ID_EX_instruction_i, EX_MEM_instruction_i, MEM_WB_instruction_i, EX_MEM_regWrite_i, MEM_WB_regWrite_i, forA_o, forB_o);
	input [31:0] ID_EX_instruction_i, EX_MEM_instruction_i, MEM_WB_instruction_i;
	input EX_MEM_regWrite_i, MEM_WB_regWrite_i;
	output [1:0] forA_o, forB_o;
	reg [1:0] forA_o, forB_o;
	always@(*/*ID_EX_instruction_i, EX_MEM_instruction_i, MEM_WB_instruction_i, EX_MEM_regWrite_i, MEM_WB_regWrite_i*/)
	begin
		if(EX_MEM_regWrite_i == 1'b1 && EX_MEM_instruction_i[15:11] != 5'd0 && EX_MEM_instruction_i[15:11] == ID_EX_instruction_i[25:21])	//ex_mem.rd == id_ex.rs
		begin
			forA_o <= 2'b10;
		end
		else if(MEM_WB_regWrite_i == 1'b1 && MEM_WB_instruction_i[15:11] != 5'd0 && MEM_WB_instruction_i[15:11] == ID_EX_instruction_i[25:21])	//mem_wb.rd == id_ex.rs
		begin
			forA_o <= 2'b01;
		end
		else begin
			forA_o <= 2'b00;
		end
	end
	always@(*)
	begin
		if(EX_MEM_regWrite_i == 1'b1 && EX_MEM_instruction_i[15:11] != 5'd0 && EX_MEM_instruction_i[15:11] == ID_EX_instruction_i[20:16])	//ex_mem.rd == id_ex.rt
		begin
			forB_o <= 2'b10;
		end
		
		else if(MEM_WB_regWrite_i == 1'b1 && MEM_WB_instruction_i[15:11] != 5'd0 && MEM_WB_instruction_i[15:11] == ID_EX_instruction_i[20:16])	//mem_wb.rd == id_ex.rt
		begin
			forB_o <= 2'b01;
		end
		else begin
			forB_o <= 2'b00;
		end
	end
endmodule
