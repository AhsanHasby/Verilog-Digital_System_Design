module jk_updown (
	input clk, rstn, mode,
	output [3:0] count
);
	wire [2:0] next_clk;
	wire [3:0] qbar;
	
	JK_FF jk0 (1'b1, 1'b1, clk, rstn, count[0], qbar[0]);
	assign next_clk[0] = mode ? count[0] : qbar[0];
	JK_FF jk1 (1'b1, 1'b1, next_clk[0], rstn, count[1], qbar[1]);
	assign next_clk[1] = mode ? count[1] : qbar[1];
	JK_FF jk2 (1'b1, 1'b1, next_clk[1], rstn, count[2], qbar[2]);
	assign next_clk[2] = mode ? count[2] : qbar[2];
	JK_FF jk3 (1'b1, 1'b1, next_clk[2], rstn, count[3], qbar[3]);
endmodule

module jk_updown_TB;
	reg clk, rstn, mode;
	wire [3:0] count;
	
	jk_updown dut (clk, rstn, mode, count);
	
	always #5 clk = ~clk;
	initial begin 
		$monitor("Count = %b (%0d)", count, count);
		clk = 0; rstn = 0; mode = 0;
		#20 rstn = 1; 
		#160; mode = 1;
		#160;
		$stop;
	end

endmodule
