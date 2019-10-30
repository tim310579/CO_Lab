module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less ); 
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;


  /*your code here*/
  wire addres, subres, addout, andres, orres, nandres, norres, sltres;
	
	//add
		assign addres = a^b^carryIn;
		assign addout = (a&&b)||(b&&carryIn)||(carryIn&&a);
		
	//sub
		//assign carryIn = 1'b1;
		assign subres = (a&!invertA)^!b^(invertB);
			//cout = (a&!b)|(!b&cin)|(cin&a);
		//assign carryOut = 0;
	//and
		assign andres = a&b;	
	//nor
		assign norres = !(a|b);
	//or
		assign orres = a|b;	
	//nand
		assign nandres = !(a&b);	
	//slt
		assign sltres = less;	
		
  wire tmp = 1'b0;
  assign result = (!invertA)&&(!invertB)&&(operation[1])&&(!operation[0])&&addres || (!invertA)&&(invertB)&&(operation[1])&&(!operation[0])&&subres ||(!invertA)&&(!invertB)&&(!operation[1])&&(operation[0])&&andres ||(!invertA)&&(!invertB)&&(!operation[1])&&(!operation[0])&&orres ||(invertA)&&(invertB)&&(operation[1])&&(operation[0])&&nandres ||(invertA)&&(invertB)&&(!operation[1])&&(operation[0])&&norres ||(!invertA)&&(invertB)&&(operation[1])&&(operation[0])&&sltres;
  assign carryOut = (!invertA)&&(!invertB)&&(operation[1])&&(!operation[0])&&addout || tmp;
  
endmodule
