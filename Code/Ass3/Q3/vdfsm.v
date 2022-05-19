`timescale 1ns/1ps

module vdfsm(input clk,input reset, input L, input R, output speed_0,
	     output speed_1 ,output speed_2 ,output speed_3);

parameter S0=2'b00, S1=2'b01, S2= 2'b10, S3= 2'b11 ;
reg [1:0]state; reg [1:0]next_state;



always @(*)begin

	case(state)
		S0:begin if(L)next_state=S3; else if(R) next_state=S1; else next_state= state; end
		S1:begin if(L)next_state=S0; else if(R) next_state=S2; else next_state= state; end
		S2:begin if(L)next_state=S1; else if(R) next_state=S3; else next_state= state; end
		S3:begin if(L)next_state=S2; else if(R) next_state=S0; else next_state= state; end
	endcase
	
end

	



always @(posedge clk, posedge reset)begin

	if(reset)state<=S0;

	else state<= next_state;
end


assign speed_0= (state==S0)?1:0;
assign speed_1= (state==S1)?1:0;
assign speed_2= (state==S2)?1:0;
assign speed_3= (state==S3)?1:0;


endmodule
