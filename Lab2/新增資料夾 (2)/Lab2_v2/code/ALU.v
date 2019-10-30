module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );
   
  output wire[31:0] result;
  output wire zero;
  output wire overflow;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  
  /*your code here*/
  reg [31:0] cout;
  reg less;
  genvar i;
  
  reg[3:0]cnt;
  ALU_1bit A(result[0], cout[0], aluSrc1[0], aluSrc2[0], invertA, inVertB, operation, 0, less);	//alu 0


	for(i = 1; i < 32; i = i + 1)begin	//from 1 to 31
		ALU_1bit A(result[i], cout[i], aluSrc1[i], aluSrc2[i], invertA, inVertB, operation, cout[i-1], less);
	end
  reg over;
  reg zer;
  initial
  if(cout[31] == 1'b1)	begin
	over = 1'b1;
  end
  initial
  if(result == 0)  begin
	zer = 1'b1;
  end
  else	begin
	zer = 1'b0;
  end
  assign overflow = over;
  assign zero = zer;
endmodule
