module Mux2to1( data0_i, data1_i, select_i, data_o );

parameter size = 0;			   
			
//I/O ports               
input wire	[size-1:0] data0_i;          
input wire	[size-1:0] data1_i;
input wire	select_i;
output wire	[size-1:0] data_o; 

//Main function
reg [size-1:0] data;
always@(select_i, data0_i, data1_i) begin
	case(select_i)
		1'b0: data <= data0_i;
		1'b1: data <= data1_i;
	endcase
end

assign data_o = data;
endmodule      
    