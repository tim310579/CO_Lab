module IF_ID(clk_i, rst_n, pc_i, instruction_i, pc_o, instruction_o);
	input clk_i, rst_n;
	input [31:0] pc_i, instruction_i;
	output reg[31:0] pc_o, instruction_o;
	always@(posedge clk_i, negedge rst_n)
	begin
		if(rst_n == 0)
		begin
			pc_o <= 32'd0;
			instruction_o <= 32'd0;
		end
		else
		begin
			pc_o <= pc_i;
			instruction_o <= instruction_i;
		end
	end	  
endmodule
