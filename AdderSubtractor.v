module full_adder(S, Cout, A, B, Cin);
	input A, B, Cin;
	output S, Cout;

	assign S = A ^ B ^ Cin;
	assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module AdderSubtractor();
	input [3:0] A;
	input [3:0] B;
	input M;
	output [3:0] S;
	output Cout;
	
	wire [3:0] B_xor;
	wire [3:0] Carry;
	B_xor[0] = B[0] ^ M;
	B_xor[1] = B[1] ^ M;
	B_xor[2] = B[2] ^ M;
	B_xor[3] = B[3] ^ M;
	

endmodule
