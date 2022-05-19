#Q-8
##Same File as Q3, except last three lines

#Master Clock
create_clock -name clk -period 10 [get_ports clk]

#Non_idealities in clk
set_propagated_clock [get_clocks clk]

#Constrainin Inputs and Outputs
set_input_delay -clock clk 1 [get_ports {in1 in2}]
set_input_transition 0.01 [get_ports {in1 in2}]
set_output_delay -clock clk 0.2 [get_ports {out}]

#Load on the output
set_load 0.05 [get_ports {out}]

# Multi-cycle path for setup analysis with path multiplier 8
set_multicycle_path 8 -setup -from [get_ports {in2}] -to [get_pins Ff2/D]


#False path to fix hold failure for that path
#set_false_path -hold -from [get_ports {in2}] -to [get_pins Ff2/D]


#Multi cycle path for hold analysis
set_multicycle_path 8 -hold -from [get_ports {in2}] -to [get_pins Ff2/D] 
