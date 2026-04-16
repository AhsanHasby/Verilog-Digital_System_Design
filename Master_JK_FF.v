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