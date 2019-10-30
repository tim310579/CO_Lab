module Shifter( result, leftRight, shamt, sftSrc  );
    
  output wire[31:0] result;

  input wire leftRight;
  input wire[4:0] shamt;
  input wire[31:0] sftSrc ;

  /*your code here*/ 
  genvar i;
  assign result[0] = (!leftRight)&&(sftSrc[1]);
  for(i = 1; i < 31; i = i + 1) begin
	assign result[i] =((!leftRight)&&(sftSrc[i+1])) || (leftRight&&sftSrc[i-1]);
  end
  assign result[31] = leftRight&&sftSrc[30];
endmodule