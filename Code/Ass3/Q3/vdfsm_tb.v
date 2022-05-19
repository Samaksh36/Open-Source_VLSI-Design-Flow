//`include "vdfsm.v"
`timescale 1ns/1ps


module vdfsm_tb();

wire speed_0; wire speed_1; wire speed_2; wire speed_3;

reg L,R,clk,reset;

vdfsm uut(clk, reset, L, R, speed_0, speed_1, speed_2, speed_3);

initial begin
	clk=0;
	reset=1;
	L=0;
	R=0;
	#5;
end

always begin
	clk= ~clk;
	#5;
end


initial begin

	$dumpfile("vdfsm_vcd.vcd");
	$dumpvars(0, vdfsm_tb);

	reset=1;
	#2;
	reset=0;
	#2;

	L=1;	#10;

	L=0;	R=1;	#10;

	R=1;	#10;

	R=1;	#10;

	R=0;	L=1;	#10;

	L=1;	#10;

	L=1;	#10;

	$finish;
end

endmodule
