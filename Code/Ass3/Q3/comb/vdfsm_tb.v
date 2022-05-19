//`include "vdfsm.v"
`timescale 1ns/1ps


module vdfsm_tb();

wire [3:0]speed;

reg [1:0]LR;
reg clk,reset;

vdfsm uut(clk, reset, LR, speed);

initial begin
	clk=0;
	reset=1;
	LR=0;
	#5;
end


always begin
	clk= ~clk;
	#5;
end


initial begin

	$dumpfile("vdfsm_vcd.vcd");
	$dumpvars(0, vdfsm_tb);

	reset=1; #2;
	reset=0; #2;

	LR=1;	#10;
	LR=1;	#10;
	LR=1;	#10;
	LR=1;	#10;
	LR=2;	#10;
	LR=2;	#10;
	LR=1;	#10;
	LR=2;	#10;
	LR=1;	#10;
	LR=1;   #10;
	LR=1;	#10
	LR=2;	#10;

	$finish;
end

endmodule

