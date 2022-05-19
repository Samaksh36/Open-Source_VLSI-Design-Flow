module Q5(
	input A,
	input B,
	input C,
	output Sum,
	output Carry
);

always @(*) begin
	Sum=A^B^C;
	Carry=(A&(((~B)&C) |(B&(~C)) |(B&C)))|((~A)&B&C);
end
endmodule
