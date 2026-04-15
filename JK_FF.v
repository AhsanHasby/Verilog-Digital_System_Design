// Master Slave JK Flip-Flop:
module JK_FF(
	input j, k, clk, clr,
	output q, qbar
);
	wire clk_bar, clr_bar;
	wire m1, m2, s1, s2;
	wire q_m, qbar_m, q_s, qbar_s;
	
	not (clk_bar, clk);
	not (clr_bar, clr);

	nand (m1, j, qbar_m, clk);
	nand (m2, k, q_m, clk);
	nand (q_m, m1, qbar_m);
	nand (qbar_m, m2, q_m);

	nand (s1, q_m, qbar_s, clk_bar);
	nand (s2, qbar_m, q_s, clk_bar);
	nand (q_s, s1, qbar_s);
	nand (qbar_s, s2, q_s);

	nand (q, q_s, clr_bar);
	nand (qbar, qbar_s, clr_bar);
		

endmodule

