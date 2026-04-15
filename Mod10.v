module Mod10 (
	input clk,
	output [3:0] count
);
	reg j = 1, k = 1;
	wire [3:0] q, qb;
	wire rst;
	
	nand (rst, q[3], q[1]);

	JK_FF ff0 (.j(j), .k(k), .clk(clk), .clr(rst), .q(q[0]), .qbar(qb[0])); 
	JK_FF ff1 (.j(j), .k(k), .clk(q[0]), .clr(rst), .q(q[1]), .qbar(qb[1])); 
	JK_FF ff2 (.j(j), .k(k), .clk(q[1]), .clr(rst), .q(q[2]), .qbar(qb[2])); 
	JK_FF ff3 (.j(j), .k(k), .clk(q[2]), .clr(rst), .q(q[3]), .qbar(qb[3])); 
	
	assign count = {q[3], q[2], q[1], q[0]};

endmodule

module Mod10_TB;
	reg clk;
	wire [3:0] count;

	Mod10 mod (.clk(clk), .count(count));
	// Clock Generation :
	initial begin 
		clk = 0;
		forever #50 clk = ~clk;
	end
	// Simulation : 
	initial begin 
		$monitor("Count = %b (%0d)", count, count);
		#2000;
		$finish;
	end

endmodule
