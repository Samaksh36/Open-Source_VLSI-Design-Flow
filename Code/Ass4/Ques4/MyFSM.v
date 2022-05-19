module MyFSM(in,clk,rst,out);
input in, clk, rst;
output out;
reg out;
reg [2:0] cS; //state elements of the FSM
reg [2:0] nS; //holds the next state
//state encoding (one-hot)
parameter S0=3'b001,S1=3'b010,S2=3'b100;
//combinational logic for state transition
always @(*) begin
	case (cS)
		S0:	if (in==1'b1)
				nS=S1;
		   	else
				nS=S0;
		S1:     if (in==1'b0)
                                nS=S2;
                        else
                                nS=S1;
		S2:	nS=S0;
	   default: nS=S0;
   	endcase	   
end
//combinational logic for output
always @(*) begin
	case (cS)
		S0:     out=1'b0;                                
                S1:     out=1'b0;
                S2:     if (in==1'b0)
                                out=1'b1;
                        else
                                out=1'b0;
           default: out=1'b0;
        endcase
end
//state transition on clock edges
always @(posedge clk or posedge rst) begin
	if (rst)
		cS<=S0;
	else
		cS<=nS;
end
endmodule
