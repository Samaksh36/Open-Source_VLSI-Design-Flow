# Q6

#Increasing The Transition Time on input

create_clock -name clk -period 10 [get_ports clk]
set_propagated_clock [get_clocks clk]


set_input_delay -clock clk 1 [get_ports {in1 in2}]

#Setting the transition time to 0.75 (Also, checked on 0.5 and 1)
set_input_transition 0.75 [get_ports {in1 in2}]


set_output_delay -clock clk 0.2 [get_ports {out}]
set_load 0.05 [get_ports {out}]



