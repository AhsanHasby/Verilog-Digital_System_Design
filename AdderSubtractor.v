module full_adder(
	input a, b, cin,
	output s, cout
);
	assign s = a ^ b ^ cin;
	assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module AdderSubtractor(
	input [3:0] A,
	input [3:0] B,
	input M,
	output [3:0] Sum,
	output Cout
);
	wire [3:0] B_xor;
	wire [3:0] Carry;
	assign B_xor = B ^ {4{M}};
	
	full_adder fa0(.a(A[0]), .b(B_xor[0]), .cin(M), .cout(Carry[0]), .s(Sum[0]));
	full_adder fa1(.a(A[1]), .b(B_xor[1]), .cin(Carry[0]), .cout(Carry[1]), .s(Sum[1]));
	full_adder fa2(.a(A[2]), .b(B_xor[2]), .cin(Carry[1]), .cout(Carry[2]), .s(Sum[2]));
	full_adder fa3(.a(A[3]), .b(B_xor[3]), .cin(Carry[2]), .cout(Cout), .s(Sum[3]));	

endmodule

module AdderSubtractor_TB;
	reg [3:0] A, B;
	reg M;
	wire [3:0] Sum;
	wire Cout;

	AdderSubtractor AS(.A(A), .B(B), .M(M), .Sum(Sum), .Cout(Cout));
	
	initial begin
		$monitor("A = %b, B = %b, M = %b | Sum = %b, Cout = %b", A, B, M, Sum, Cout);

		A = 4'b1001; B = 4'b1000; M = 0; #100;
		A = 4'b1001; B = 4'b1000; M = 1; #100;
		A = 4'b1111; B = 4'b1111; M = 0; #100;
		A = 4'b1111; B = 4'b1111; M = 1; #100;
		$finish;
	end

endmodule
