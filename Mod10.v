`timescale 1ns / 1ps

module JKFF (J, K, Clock, clr_n, Q, Qn);
    input J, K, Clock, clr_n;
    output Q, Qn;

    wire clk_inv;
    wire j_gate, k_gate;
    wire m_q, m_qn;
    wire s_j_gate, s_k_gate;
    not (clk_inv, Clock);

    nand (j_gate, J, Clock, Qn, clr_n);
    nand (k_gate, K, Clock, Q);
    nand (m_q, j_gate, m_qn);
    nand (m_qn, k_gate, m_q, clr_n);

    nand (s_j_gate, m_q, clk_inv);
    nand (s_k_gate, m_qn, clk_inv);
    nand (Q, s_j_gate, Qn);
    nand (Qn, s_k_gate, Q, clr_n);
endmodule

module Mod10Counter (count, clk, external_reset);
    output [3:0] count;
    input clk, external_reset;
    
    wire [3:0] q_not;
    wire rst10;
    wire master_clr_n;

    nand #1 (rst10, count[3], count[1]); 
    and #1 (master_clr_n, external_reset, rst10);

    JKFF ff0 (1'b1, 1'b1, clk, master_clr_n, count[0], q_not[0]);
    JKFF ff1 (1'b1, 1'b1, count[0], master_clr_n, count[1], q_not[1]);
    JKFF ff2 (1'b1, 1'b1, count[1], master_clr_n, count[2], q_not[2]);
    JKFF ff3 (1'b1, 1'b1, count[2], master_clr_n, count[3], q_not[3]);
endmodule

module tb_Mod10Counter();
    reg clk;
    reg external_reset;
    wire [3:0] count;    
    Mod10Counter uut ( .count(count), .clk(clk), .external_reset(external_reset));    
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        external_reset = 0;        
        #15 external_reset = 1;        
        #500;
        $stop;
    end
endmodule
