module full_adder(
	input a, b, cin;
	output s, cout;
);
	assign s = a ^ b ^ cin;
	assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module AdderSubtractor(
	input [3:0] A;
	input [3:0] B;
	input M;
	output [3:0] Sum;
	output Cout;
);
	wire [3:0] B_xor;
	wire [3:0] Carry;
	B_xor[0] = B[0] ^ M;
	B_xor[1] = B[1] ^ M;
	B_xor[2] = B[2] ^ M;
	B_xor[3] = B[3] ^ M;
	
	full_adder fa0(.a(A[0]), .b(B_xor[0]), .cin(M), .cout(Carry[0]), .s(Sum[0]));
	full_adder fa1(.a(A[1)), .b(B_xor[1]), .cin(Carry[0]), .cout(Carry[1]), .s(Sum[1]));
	full_adder fa2(.a(A[2]), .b(B_xor[2]), .cin(Carry[1]), .cout(Carry[2]), .s(Sum[2]));
	full_adder fa3(.a(A[3]), .b(B_xor[3]), .cin(Carry[2]), .cout(Cout), .s(Sum[3]));	

endmodule


