`timescale 1ns / 1ps

module JKFF (J, K, Clock, clr_n, Q, Qn);
    input J, K, Clock, clr_n;
    output Q, Qn;

    wire clk_inv;
    wire j_gate, k_gate;
    wire m_q, m_qn;
    wire s_j_gate, s_k_gate;
    not (clk_inv, Clock);

    nand (j_gate, J, Clock, Qn);
    nand (k_gate, K, Clock, Q);
    nand (m_q, j_gate, m_qn);
    nand (m_qn, k_gate, m_q, clr_n);

    nand (s_j_gate, m_q, clk_inv);
    nand (s_k_gate, m_qn, clk_inv);
    nand (Q, s_j_gate, Qn);
    nand (Qn, s_k_gate, Q, clr_n);
endmodule

module async_up_down_counter (Clk, M, clr_n, Q);
    input Clk, M, clr_n;
    output [2:0] Q;
    
    wire [2:0] Qn; 
    wire M_inv, and1_top, and1_bot, clk2, and2_top, and2_bot, clk3;
    
    not (M_inv, M);

    JKFF ff1 (1'b1, 1'b1, Clk, clr_n, Q[0], Qn[0]);

    and (and1_top, M_inv, Q[0]);
    and (and1_bot, M, Qn[0]);
    or  (clk2, and1_top, and1_bot);

    JKFF ff2 (1'b1, 1'b1, clk2, clr_n, Q[1], Qn[1]);

    and (and2_top, M_inv, Q[1]);
    and (and2_bot, M, Qn[1]);
    or  (clk3, and2_top, and2_bot);

    JKFF ff3 (1'b1, 1'b1, clk3, clr_n, Q[2], Qn[2]);
endmodule

module tb_async_up_down_counter;
    reg Clk;
    reg M;
    reg clr_n;
    wire [2:0] Q;

    async_up_down_counter uut (.Clk(Clk), .M(M), .clr_n(clr_n), .Q(Q));

    always #5 Clk = ~Clk;

    initial begin
        Clk = 0;
        M = 0;
        clr_n = 0;
        
        #10 clr_n = 1; 
        #100 M = 1;    
        #100 $stop;
    end
endmodule
