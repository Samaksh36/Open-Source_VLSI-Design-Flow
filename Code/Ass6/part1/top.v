module top(input clk, input in1, input in2, output out);

wire clk1; wire clk2; wire clk3; wire clk4;
wire d1; wire d2; wire d3;
wire q1; wire q2; wire q3; wire q4;



CLKINVX1 Inv1(clk, clk1);
CLKINVX1 Inv2(clk1, clk2);
CLKINVX1 Inv3(clk, clk3);
CLKINVX1 Inv4(clk3, clk4);

CLKINVX1 Inv5(in1, d1);
NAND2X1 Nand1(in1, in2, d2);

SDFFX1 Ff1(.CK(clk2), .D(d1), .Q(q1));
SDFFX1 Ff2(.CK(clk), .D(d2), .Q(q2));

CLKINVX1 Inv6(q2, q3);
NOR2X1 Nor1(q1,q3,d3);

SDFFX1 Ff3(.CK(clk4), .D(d3), .Q(q4));
CLKINVX1 Inv7(q4, out);

endmodule
