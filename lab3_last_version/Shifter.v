module Shifter( result, leftRight, shamt, sftSrc );

//I/O ports 
output	[32-1:0] result;

input			leftRight;
input	[5-1:0] shamt;
input	[32-1:0] sftSrc ;

//Internal Signals
wire	[32-1:0] result;
  
//Main function
reg [31:0] res;
always@(leftRight, sftSrc, shamt) begin
	case(leftRight)
		1'b0: res <= sftSrc >> shamt;
		1'b1: res <= sftSrc << shamt;
	endcase
end

assign result = res;

endmodule
