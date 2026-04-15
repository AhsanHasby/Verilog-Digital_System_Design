module FullAdder_1bit (
	input a, b, cin,
	output sum, cout
);
	assign sum = a ^ b ^ cin;
	assign cout = (a & b) | (b & cin) | (a & cin);

endmodule

module FullAdder_4bit(
	input [3:0] a, b,
	input cin, 
	output [3:0] sum,
	output cout
);
	wire [3:0] carry;

	FullAdder_1bit FA0(.a(a[0]), .b(b[0]), .cin(cin),       .sum(sum[0]), .cout(carry[0]));
	FullAdder_1bit FA1(.a(a[1]), .b(b[1]), .cin(carry[0]),  .sum(sum[1]), .cout(carry[1]));
	FullAdder_1bit FA2(.a(a[2]), .b(b[2]), .cin(carry[1]),  .sum(sum[2]), .cout(carry[2]));
	FullAdder_1bit FA3(.a(a[3]), .b(b[3]), .cin(carry[2]),  .sum(sum[3]), .cout(carry[3]));

	assign cout = carry[3];

endmodule
