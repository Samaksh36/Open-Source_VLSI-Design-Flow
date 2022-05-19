module des1(input in, input clk, output out);


//CLKINVX1
//AND2X1
//XNOR2X1
//SDFFX1

wire in11; wire in12; wire q1; wire q2; wire d; wire q3;

CLKINVX1 Inv1(in, in11);
CLKINVX1 Inv2(in, in12);

SDFFX1 Ff1(.CK(clk), .D(in11), .Q(q1));
SDFFX1 Ff2(.CK(clk), .D(in12), .Q(q2));

XNOR2X1 Xnor1(q1,q2,d);
SDFFX1 Ff3(.CK(clk), .D(d), .Q(q3));

CLKINVX1 Inv3(q3, out);


endmodule




