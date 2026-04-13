module HalfAdder(S, C, A, B);
	input A, B;
	output S, C;
	xor(S, A, B);
	and(C, A, B);
endmodule

module HalfAdderTB;
	reg A, B;
	wire S, C;
	HalfAdder HA(S, C, A, B);
	initial begin
		$monitor("Time = %0t | A = %b, B = %b | S = %b, C = %b", $time, A, B, S, C);
		A = 0; B = 0; #10;
		A = 0; B = 1; #10;
		A = 1; B = 0; #10;
		A = 1; B = 1; #10;
	end
endmodule
