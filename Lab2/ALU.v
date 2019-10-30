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
  wire [31:0] cout;
  wire less;

  wire le;

  wire set;
  genvar i;
  reg clk;
  //reg [31:0] A;
  assign less = 1'b0;
  assign le = 1'b0;
  
  ALU_1bit A(result[0], cout[0], aluSrc1[0], aluSrc2[0], invertA, invertB, operation, le, less);
	for(i = 1; i < 32; i = i + 1) begin
		ALU_1bit Ai(result[i], cout[i], aluSrc1[i], aluSrc2[i], invertA, invertB, operation, cout[i-1], le);
		
	end
/*
  ALU_1bit A0(result[0], cout[0], aluSrc1[0], aluSrc2[0], invertA, invertB, operation, le, less);
  ALU_1bit A1(result[1], cout[1], aluSrc1[1], aluSrc2[1], invertA, invertB, operation, cout[0], le);
  ALU_1bit A2(result[2], cout[2], aluSrc1[2], aluSrc2[2], invertA, invertB, operation, cout[1], le);
  ALU_1bit A3(result[3], cout[3], aluSrc1[3], aluSrc2[3], invertA, invertB, operation, cout[2], le);
  ALU_1bit A4(result[4], cout[4], aluSrc1[4], aluSrc2[4], invertA, invertB, operation, cout[3], le);
  ALU_1bit A5(result[5], cout[5], aluSrc1[5], aluSrc2[5], invertA, invertB, operation, cout[4], le);
  ALU_1bit A6(result[6], cout[6], aluSrc1[6], aluSrc2[6], invertA, invertB, operation, cout[5], le);
  ALU_1bit A7(result[7], cout[7], aluSrc1[7], aluSrc2[7], invertA, invertB, operation, cout[6], le);
  ALU_1bit A8(result[8], cout[8], aluSrc1[8], aluSrc2[8], invertA, invertB, operation, cout[7], le);
  ALU_1bit A9(result[9], cout[9], aluSrc1[9], aluSrc2[9], invertA, invertB, operation, cout[8], le);

  ALU_1bit A10(result[10], cout[10], aluSrc1[10], aluSrc2[10], invertA, invertB, operation, cout[9], le);
  ALU_1bit A11(result[11], cout[11], aluSrc1[11], aluSrc2[11], invertA, invertB, operation, cout[10], le);
  ALU_1bit A12(result[12], cout[12], aluSrc1[12], aluSrc2[12], invertA, invertB, operation, cout[11], le);
  ALU_1bit A13(result[13], cout[13], aluSrc1[13], aluSrc2[13], invertA, invertB, operation, cout[12], le);
  ALU_1bit A14(result[14], cout[14], aluSrc1[14], aluSrc2[14], invertA, invertB, operation, cout[13], le);
  ALU_1bit A15(result[15], cout[15], aluSrc1[15], aluSrc2[15], invertA, invertB, operation, cout[14], le);
  ALU_1bit A16(result[16], cout[16], aluSrc1[16], aluSrc2[16], invertA, invertB, operation, cout[15], le);
  ALU_1bit A17(result[17], cout[17], aluSrc1[17], aluSrc2[17], invertA, invertB, operation, cout[16], le);
  ALU_1bit A18(result[18], cout[18], aluSrc1[18], aluSrc2[18], invertA, invertB, operation, cout[17], le);
  ALU_1bit A19(result[19], cout[19], aluSrc1[19], aluSrc2[19], invertA, invertB, operation, cout[18], le);

  ALU_1bit A20(result[20], cout[20], aluSrc1[20], aluSrc2[20], invertA, invertB, operation, cout[19], le);
  ALU_1bit A21(result[21], cout[21], aluSrc1[21], aluSrc2[21], invertA, invertB, operation, cout[20], le);
  ALU_1bit A22(result[22], cout[22], aluSrc1[22], aluSrc2[22], invertA, inVertB, operation, cout[21], le);
  ALU_1bit A23(result[23], cout[23], aluSrc1[23], aluSrc2[23], invertA, invertB, operation, cout[22], le);
  ALU_1bit A24(result[24], cout[24], aluSrc1[24], aluSrc2[24], invertA, invertB, operation, cout[23], le);
  ALU_1bit A25(result[25], cout[25], aluSrc1[25], aluSrc2[25], invertA, invertB, operation, cout[24], le);
  ALU_1bit A26(result[26], cout[26], aluSrc1[26], aluSrc2[26], invertA, invertB, operation, cout[25], le);
  ALU_1bit A27(result[27], cout[27], aluSrc1[27], aluSrc2[27], invertA, invertB, operation, cout[26], le);
  ALU_1bit A28(result[28], cout[28], aluSrc1[28], aluSrc2[28], invertA, invertB, operation, cout[27], le);
  ALU_1bit A29(result[29], cout[29], aluSrc1[29], aluSrc2[29], invertA, invertB, operation, cout[28], le);
 
  ALU_1bit A30(result[30], cout[30], aluSrc1[30], aluSrc2[30], invertA, invertB, operation, cout[29], le);
  ALU_1bit A31(result[31], cout[31], aluSrc1[31], aluSrc2[31], invertA, invertB, operation, cout[30], le);*/
 
  

  wire tmp = 1'b1;
	assign overflow = tmp && cout[31];
    assign zero = (!result[0]) && (!result[1]) && (!result[2]) && (!result[3]) && (!result[4]) && (!result[5]) &&
	(!result[6]) && (!result[7]) && (!result[8]) && (!result[9]) && (!result[10]) && (!result[11]) &&
	(!result[12]) && (!result[13]) && (!result[14]) && (!result[15]) && (!result[16]) && (!result[17]) &&
	(!result[18]) && (!result[19]) && (!result[20]) && (!result[21]) && (!result[22]) && (!result[23]) &&
	(!result[24]) && (!result[25]) && (!result[26]) && (!result[27]) && (!result[28]) && (!result[29]) &&
	(!result[30]) && (!result[31]);
    //for(i = 0; i < 32; i = i +1)begin
	
	//assign zero = zero && (!result[i]);
    //end

endmodule
