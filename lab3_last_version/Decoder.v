module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o );
     
//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output			RegDst_o;
 
//Internal Signals
wire	[3-1:0] ALUOp_o;
wire			ALUSrc_o;
wire			RegWrite_o;
wire			RegDst_o;

//Main function
/*your code here*/
reg [3-1:0] fALUOp_o;
reg fALUSrc_o;
reg fRegWrite_o;
reg fRegDst_o;	//fake output
always@(instr_op_i) begin
	case(instr_op_i)
		6'b000000: begin fALUOp_o <= 2; fALUSrc_o <= 0; fRegWrite_o <= 1; fRegDst_o <= 1; end
		6'b001000: begin fALUOp_o <= 4; fALUSrc_o <= 1; fRegWrite_o <= 1; fRegDst_o <= 0; end
		
	endcase
end
assign ALUOp_o = fALUOp_o;
assign ALUSrc_o = fALUSrc_o;
assign RegWrite_o = fRegWrite_o;
assign RegDst_o = fRegDst_o;
endmodule
   