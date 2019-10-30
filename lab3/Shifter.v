module Shifter( result, leftRight, shamt, sftSrc );

//I/O ports 
output	[32-1:0] result;

input			leftRight;
input	[5-1:0] shamt;
input	[32-1:0] sftSrc ;

//Internal Signals
wire	[32-1:0] result;
  
//Main function
/*your code here*/


reg [31:0] res;

always @(leftRight, shamt, sftSrc) begin
	res <= ((sftSrc >> shamt)&&!leftRight) || ((sftSrc << shamt)&&leftRight);
end
assign result = res;
endmodule
