module FullAdder(S, Cout, A, B, Cin);
	input A, B, Cin;
	output S, Cout;
	wire s1, c1, c2;
	HalfAdder HA1(s1, c1, A, B);
	HalfAdder HA2(S, c2, s1, Cin);
	assign Cout = c1 | c2;
endmodule

module FullAdderTB;
	reg A, B, Cin;
	wire S, Cout;
	FullAdder FA(S, Cout, A, B, Cin);
	initial begin
		$monitor("A = %b; B = %b; Cin = %b | S = %b; Cout = %b", A, B, Cin, S, Cout);
		A = 0; B = 0; Cin = 0; #100;
		A = 0; B = 0; Cin = 1; #100;
		A = 0; B = 1; Cin = 0; #100;
		A = 0; B = 1; Cin = 1; #100;
		A = 1; B = 0; Cin = 0; #100;
		A = 1; B = 0; Cin = 1; #100;
		A = 1; B = 1; Cin = 0; #100;
		A = 1; B = 1; Cin = 1; #100;
	end
endmodule
