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

module BCD_Adder_TB;
	reg [3:0] A, B;
	reg Cin;
	wire [3:0] Sum;
	wire Cout;
	
	BCD_Adder BA(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

	initial begin
		$monitor("A = %b, B = %b, Cin = %b | Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
		
		A = 4'b0000; B = 4'b0000; Cin = 0; #100;
		A = 4'b0001; B = 4'b0001; Cin = 0; #100;
		A = 4'b0010; B = 4'b0010; Cin = 0; #100;
		A = 4'b0011; B = 4'b0011; Cin = 0; #100;
		A = 4'b0100; B = 4'b0100; Cin = 0; #100;
		A = 4'b0101; B = 4'b0101; Cin = 0; #100;
		A = 4'b0110; B = 4'b0110; Cin = 0; #100;
		A = 4'b0111; B = 4'b0111; Cin = 0; #100;
		A = 4'b1000; B = 4'b1000; Cin = 0; #100;
		A = 4'b1001; B = 4'b1001; Cin = 0; #100;
		A = 4'b1001; B = 4'b1001; Cin = 0; #100;
 		$finish;
	end

endmodule

