module Q2 (
    input[63:0] a,
    input[63:0]b,
    output[63:0] out
);


    Q2_submod #(.WIDTH(8)) uut1(
        .a(a[7:0]),
	.b(b[7:0]),
        .out(out[7:0])
    );


    Q2_submod #(.WIDTH(32)) uut2(
        .a(a[31:0]),
	.b(b[31:0]),
        .out(out[31:0])
    );

    Q2_submod #(.WIDTH(64)) uut3(
        .a(a[63:0]),
	.b(b[63:0]),
        .out(out[63:0])
    );
 
endmodule
