module top ();
reg a, b;
initial begin 
$monitor("At time %d a=%b b=%b", $time, a, b);
a= 1'b0;
b=1'b0;
#10 a=1'b1;
#10 b=1'b1;
a <= #5 1'b0;
b <= #5 1'b0;
end
endmodule
