module Q3b (
    input[3:0] a,input[3:0] b, input[3:0] p,input[3:0] q,
    output[8:0] x,
    output[8:0] y
);

    always @(*) begin
        x = p + a*b;
	y = q + a*b;
    end

endmodule
