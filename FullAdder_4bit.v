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
	
endmodule
