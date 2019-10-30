module ALU( aluSrc1, aluSrc2, ALU_operation_i, result, zero, overflow );

//I/O ports 
input	[32-1:0] aluSrc1;
input	[32-1:0] aluSrc2;
input	 [4-1:0] ALU_operation_i;

output  [32-1:0] result;
output			 zero;
output			 overflow;

//Internal Signals
wire			 zero;
wire			 overflow;
wire	[32-1:0] result;

//Main function
/*your code here*/
reg [31:0] res;
reg [32:0] over;
assign zero = (result == 0);
always @(ALU_operation_i, aluSrc1, aluSrc2) begin
	case (ALU_operation_i)
		0: res <= aluSrc1 && aluSrc2;
		1: res <= aluSrc1 || aluSrc2;
	  	2: res <= aluSrc1 + aluSrc2;
		6: res <= aluSrc1 - aluSrc2;
		7: res <= aluSrc1 < aluSrc2 ? 1:0;
		12: res <= ~(aluSrc1 || aluSrc2);	//nor
		default: res <= 0;
	endcase
	over <=  aluSrc1 + aluSrc2;
end
assign result = res;
assign overflow = over[32];
endmodule
