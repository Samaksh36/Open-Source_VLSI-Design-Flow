# Q8
create_clock -name clk -period 10 [get_ports clk]

set_input_delay -clock clk 1 [get_pins FF1/D] 
set_input_delay -clock clk 1 [get_pins FF2/D]
set_input_delay -clock clk 1 [get_pins FF3/D]

# set_input_delay -clock clk -min 0.5 [get_ports {in1}] 
# set_input_delay -clock clk -min 0.5 [get_pins FF2/D]
# set_input_delay -clock clk -min 0.5 [get_pins FF3/D]

set_output_delay -clock clk 0.2 [get_ports {out}]

# Multi-cycle path
set_multicycle_path 8 -setup -from [get_pins FF3/CK] -to [get_ports {out}]

# false path
set_false_path -hold -from [get_pins FF1/CK] -to [get_pins FF3/CK]
# set_false_path -hold -from [get_pins FF3/CK] -to [get_ports {out}]
# set_false_path -hold -from [get_pins FF3/CK] -to [get_ports {out}]

# Tuka multicycle path
# set_multicycle_path 7 -hold -from [get_pins FF3/CK] -to [get_ports {out}]
