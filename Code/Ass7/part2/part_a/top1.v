`include "flip_flop.v"
`include "not_gate.v"
`include "and_gate.v"
`timescale 1ns/1ps


module top1(input in1, input in2, input clk, input reset, output out);

wire q11; wire q21;
wire q_not;  wire q_and;


flip_flop ff1(clk, in1, reset, q11);

not_gate ng1(q11, q_not);

//assign q_not=1;

flip_flop ff2(clk, in2, reset, q21);

and_gate ag1(q_not, q21, q_and);

flip_flop ff3(clk, q_and, reset, out);


endmodule
