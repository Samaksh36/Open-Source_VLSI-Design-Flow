module Q5(
	input wire A,
	input wire B,
	input wire C,
	output reg Sum,
	output reg Carry
);

always @(*) begin
	Sum=A^B^C;
	Carry=(A&(((~B)&C) |(B&(~C)) |(B&C)))|((~A)&B&C);
end
endmodule
