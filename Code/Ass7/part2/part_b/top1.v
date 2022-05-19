`include "flip_flop.v"
`include "not_gate.v"
`include "and_gate.v"
`timescale 1ns/1ps


module top1(input in1, input in2, input clk, input reset, output out);

wire q11; wire q12; wire q13;
wire q21; wire q22; wire q23;
wire q1; wire q2;
wire q_not;  wire q_and;

flip_flop ff1(clk, in1, reset, q11);
flip_flop ff2(clk, q11, reset, q12);
flip_flop ff3(clk, q12, reset, q13);

//not_gate ng1(q13, q_not);

assign q_not=1;

flip_flop ff4(clk, in2, reset, q21);
flip_flop ff5(clk, q21, reset, q22);
flip_flop ff6(clk, q22, reset, q23);


and_gate ag1(q_not, q23, q_and);


flip_flop ff7(clk, q_and, reset, q1);
flip_flop ff8(clk, q1, reset, q2);
flip_flop ff9(clk, q2, reset, out);


endmodule
