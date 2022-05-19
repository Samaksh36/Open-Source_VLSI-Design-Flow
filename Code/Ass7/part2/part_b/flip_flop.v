`timescale 1ns/1ps

module flip_flop(input clk, input D, input reset, output reg Q);

always @(posedge clk, posedge reset)begin

	if(reset) Q<=0;

	else Q<=D;

end

endmodule
