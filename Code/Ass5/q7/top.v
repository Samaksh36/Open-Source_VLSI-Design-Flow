module top(
    input clk,
    input in1,
    input in2,
    output out
);
// CLKINVX1
// NAND2X1
// SDFFX1

wire clk1; wire clk2; wire clk3; wire clk4; wire clk5; wire clk6;
wire q1; wire q2; wire q3; wire q4;
wire in22;


CLKINVX1 Inv1(clk, clk1);
CLKINVX1 Inv2(clk1, clk2);
CLKINVX1 Inv3(clk1, clk3);
CLKINVX1 Inv4(clk1, clk4);
CLKINVX1 Inv5(clk4, clk5);
CLKINVX1 Inv6(clk5, clk6);


SDFFX1 Ff1(.CK(clk2), .D(in1), .Q(q1));
SDFFX1 Ff2(.CK(clk3), .D(in22), .Q(q2));
SDFFX1 Ff3(.CK(clk6), .D(q4), .Q(out));


CLKINVX1 Inv7(in2, in22);
CLKINVX1 Inv8(q2, q3);

NAND2X1 Nand1(q1, q3, q4);



endmodule
