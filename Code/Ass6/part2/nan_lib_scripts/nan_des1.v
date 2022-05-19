//`include "NanGate_15nm_OCL_worst_low_conditional_nldm.lib"

module nan_des1(input in, input clk, output out);


//CLKINVX1
//AND2X4
//XNOR2X1
//SDFFX1
//BUFX2

wire in11; wire in12; wire q1; wire q2; wire d; wire q3;

INV_X1 inv1(in, in11);
BUF_X1 buf1(in, in12);

DFFRNQ_X1 ff1(.CLK(clk), .D(in11), .Q(q1));
DFFRNQ_X1 ff2(.CLK(clk), .D(in12), .Q(q2));

XNOR2_X1 xnor1(q1,q2,d);
DFFRNQ_X1 ff3(.CLK(clk), .D(d), .Q(q3));

INV_X1 inv2(q3, out);


endmodule




