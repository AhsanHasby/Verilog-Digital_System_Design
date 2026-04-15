// Master Slave JK Flip-Flop:
module JK_FF(
	input j, k, clk, clear,
	output q, qbar;
);
	wire clk_bar, clear_bar;
	wire m1, m2, s1, s2;
	wire q_in, qbar_in;
	
	not (clk_bar, clk);
	not (clear_bar, clear);

	nand (m1, j, qbar_in, clk);
	nand (m2, k, q_in, clk);

	nand (s1, m1, clk_bar);
	nand (s2, m2, clk_bar);

	nand (q, s1, qbar_in, clear_bar);
	nand (qbar, s2, q_in, clear_bar);
	

endmodule

