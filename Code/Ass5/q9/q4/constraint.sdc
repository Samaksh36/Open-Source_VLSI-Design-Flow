# Q4

create_clock -name clk -period 10 [get_ports clk]
set_propagated_clock [get_clocks clk]

set_input_delay -clock clk 1 [get_ports {in1 in2}]
set_input_transition 0.01 [get_ports {in1 in2}]

set_output_delay -clock clk 0.2 [get_ports {out}]
set_load 0.05 [get_ports {out}]

# Add Clock latency
set_clock_latency 0.8 -source [get_clocks clk]
set_clock_latency 1.1 [get_clocks clk]

# Add Clock Transition
set_clock_transition 0.75 clk

# Add clock uncertainity
set_clock_uncertainty -setup 0.2 [get_clocks clk] 
set_clock_uncertainty -hold 0.05 [get_clocks clk]