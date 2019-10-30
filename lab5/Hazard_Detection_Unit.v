module  Hazard_Detection_Unit(ID_EX_MemRead_i, IF_ID_Rs_i, IF_ID_Rt_i, ID_EX_Rt_i, PC_write_o, IF_ID_flush_o, ID_EX_flush_o );
	input ID_EX_MemRead_i;
	input [4:0] IF_ID_Rs_i, IF_ID_Rt_i, ID_EX_Rt_i;
	output reg PC_write_o, IF_ID_flush_o, ID_EX_flush_o;
	always@(ID_EX_MemRead_i, IF_ID_Rs_i, IF_ID_Rt_i, ID_EX_Rt_i)
	begin
		if(ID_EX_MemRead_i == 1'b1 && ((IF_ID_Rs_i == ID_EX_Rt_i) || (IF_ID_Rt_i == ID_EX_Rt_i)))
		begin
			PC_write_o <= 1'b0; 
			IF_ID_flush_o <= 1'b0;
			ID_EX_flush_o <= 1'b1;
		end
		else begin
			PC_write_o <= 1'b1;
			IF_ID_flush_o <= 1'b1;
			ID_EX_flush_o <= 1'b0;
		end
	end

endmodule
