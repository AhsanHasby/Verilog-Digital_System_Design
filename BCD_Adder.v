module BCD_Adder(
	input [3:0] A, B,
	input Cin,
	output [3:0] Sum,
	output Cout 
);
	wire [3:0] binary_sum;
	wire binary_cout;
	wire correction;
	wire [3:0] add6;
	
	FullAdder_4bit FA1(.a(A), .b(B), .cin(Cin), .sum(binary_sum), .cout(binary_cout));
	
	assign correction = binary_cout | (binary_sum[3] & binary_sum[2]) | (binary_sum[3] & binary_sum[1]);

	assign add6 = {1'b0, correction, correction, 1'b0};
	
	FullAdder_4bit FA2(.a(binary_sum), .b(add6), .cin(1'b0), .sum(Sum), .cout(Cout));

endmodule


