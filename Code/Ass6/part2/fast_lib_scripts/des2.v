//`include "fast.lib"

module des2(input in, input clk, output out);


//CLKINVX1
//AND2X4
//XNOR2X1
//SDFFX1
//BUFX2

wire in11; wire in12; wire q1; wire q2; wire d; wire q3;

CLKINVX1 inv1(in, in11);
BUFX2 buf2(in, in12);

SDFFX1 ff1(.CK(clk), .D(in11), .Q(q1));
SDFFX1 ff2(.CK(clk), .D(in12), .Q(q2));

AND2X4 and1(q1,q2,d);
SDFFX1 ff3(.CK(clk), .D(d), .Q(q3));

CLKINVX1 inv2(q3, out);


endmodule
