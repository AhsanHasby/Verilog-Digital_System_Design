module JK_FF (
    input j,
    input k,
    input clk,
    input rstn,
    output reg q,
    output q_bar
);
    assign q_bar = ~q;

    always @(posedge clk or negedge rstn) begin
        if (!rstn)
		q <= 1'b0;
        else
		q<=~q; 
    end
endmodule
