module top();
reg clk ,en ,a ,b;
initial begin
	clk = 1'b0;
	en  = 1'b0;
	a   = 1'b0;
	b   = 1'b0;

	$monitor("At time %d clk=%b en=%b a=%b b=%b", $time, clk, en, a,b);
	#3 en= 1'b1;
	#5 en= 1'b0;

	$finish;
end


always #2 clk= ~clk;
always @(en) a= clk;
always begin
	wait (en) #1 b= ~b;
end
endmodule
