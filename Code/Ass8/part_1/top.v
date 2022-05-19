module top (input clk, input rst, input [31:0] in1, input [31:0] in2, input control, output reg [31:0] out);

    reg [31:0] in1_stage1;
    reg [31:0] in2_stage1;
    reg [31:0] in1_stage2;
    reg [31:0] in2_stage2;

    always @(posedge clk) begin
        in1_stage1 <= in1;
        in2_stage1 <= in2;
    end

    always @(posedge clk) begin
	    if(rst) begin in1_stage2 <= 0; end
	else begin
		if(control) begin in1_stage2 <= in1_stage1;
    end
    end
    end

    always @(posedge clk) begin
	    if(rst) begin in2_stage2 <= 0; end
	else begin 
		if(control) begin in2_stage2 <= in2_stage1;
    end
    end
    end

    always @(*) begin
        out = (in1_stage2 & in2_stage2) ^ 32'b1;
    end

endmodule
