`include "top1.v"

module top1_tb();

reg in1; reg in2; reg clk; reg reset;

wire out;


top1 uut(in1, in2, clk, reset, out);


initial begin
reset=1;
clk=0;
in1=0;
in2=0;
end

always begin
	#5;
	clk= ~clk;
	
end



initial begin

	$dumpfile("top1vcd.vcd");
	$dumpvars(0, top1_tb);
	reset=1;
	#2;

	reset=0;
	in1=1;
	in2=1;
	#50;

	$finish;

end

endmodule

