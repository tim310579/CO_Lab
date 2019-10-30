module Adder( src1_i, src2_i, sum_o	);

//I/O ports
input	[32-1:0] src1_i;
input	[32-1:0] src2_i;
output	[32-1:0] sum_o;

//Internal Signals
wire	[32-1:0] sum_o;
    
//Main function
/*your code here*/
genvar i;
assign sum_o[0] = src1_i[0]^src2_i[0];
for(i = 1; i < 32; i = i + 1) begin
	assign sum_o[i] = (src1_i[i-1]&src2_i[i-1])^src1_i[i]^src2_i[i];
end


endmodule
