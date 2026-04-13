module BCD2Ex3(A, B, C, D, W, X, Y, Z);
	input A, B, C, D;
	output W, X, Y, Z;
	assign Z = ~D;
	assign Y = (C & D) | (~C & ~D);
	assign X = (~B & C) | (~B & D) | (B & ~C & ~D);
	assign W = A | (B & (C | D));
endmodule

module BCD2Ex3_TB;
	reg A, B, C, D;
	wire W, X, Y, Z;
	integer i;
	BCD2Ex3 B2E(A, B, C, D, W, X, Y, Z);
	initial begin 
		for(i = 0; i <= 9; i = i + 1) begin
			{A, B, C, D} = i; #100;
			$display("BCD = %b%b%b%b -> EX3 = %b%b%b%b", A, B, C, D, W, X, Y, Z);
		end
	end
endmodule
