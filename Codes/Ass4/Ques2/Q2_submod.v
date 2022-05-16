module Q2_submod #(
    parameter WIDTH = 64
) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0]b,
    output [WIDTH-1:0] out
);
    assign out = a & b;
endmodule
