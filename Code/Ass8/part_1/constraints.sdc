create_clock -name clk -period 4.0 [get_ports "clk"] 
set_propagated_clock [get_clocks "clk"]
set_clock_transition -rise 0.5 [get_clocks "clk"]
set_clock_transition -fall 0.5 [get_clocks "clk"]
set_clock_uncertainty 0.5 [get_clocks "clk"]
set_clock_latency 0.5 [get_clocks "clk"]

set_input_delay -max 1.2 [get_ports "rst"] -clock [get_clocks "clk"]
set_input_delay -min 0.5 [get_ports "rst"] -clock [get_clocks "clk"]

set_input_delay -max 1.2 [get_ports "A"] -clock [get_clocks "clk"]
set_input_delay -min 0.5 [get_ports "A"] -clock [get_clocks "clk"]

set_input_delay -max 1.2 [get_ports "B"] -clock [get_clocks "clk"]
set_input_delay -min 0.5 [get_ports "B"] -clock [get_clocks "clk"]

set_input_delay -max 1.2 [get_ports "C"] -clock [get_clocks "clk"]
set_input_delay -min 0.5 [get_ports "C"] -clock [get_clocks "clk"]

set_input_transition -max 1.2 [get_ports rst]
set_input_transition -min 0.9 [get_ports rst]

set_input_transition -max 1.2 [get_ports A]
set_input_transition -min 0.9 [get_ports A]

set_input_transition -max 5.0 [get_ports B]
set_input_transition -min 0.9 [get_ports B]

set_input_transition -max 1.2 [get_ports C]
set_input_transition -min 0.9 [get_ports C]

set_output_delay -max 1.5 [get_ports "out"] -clock [get_clocks "clk"]
set_output_delay -min 0.8 [get_ports "out"] -clock [get_clocks "clk"]

