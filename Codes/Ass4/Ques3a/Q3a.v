module Q3a (
    input sel,input [3:0] a,input [3:0]b,input [3:0]x, input [3:0]y, output reg [7:0]z
);

always @(*) begin
        if (sel == 1'b0) begin
            z = a * b;
        end       
	    else begin
            z = x * y;
        end
    end

endmodule
