#reading the technology library specified in the given liberty file.
#read_liberty -lib fast.lib
read_liberty -lib NanGate_15nm_OCL_fast_conditional_ccs.lib 
# reading the design using the Verilog frontend (icarus Verilog)
# read_verilog : Load modules from a Verilog file to the current design
#NOTE: in case of multiple .v files each file should be read individually
read_verilog MyFSM.v
hierarchy -top MyFSM

# convert high-level behavioral parts ("processes") to d-type flip-flops and muxes
proc 

# perform some simple optimizations
opt

# Resource Sharing
# share -force
show

# convert high-level memory constructs to d-type flip-flops and multiplexers
memory
opt

# convert design to (logical) gate-level netlists
techmap
opt

# technology mapping of flip-flops
#Map internal flip-flop cells to the flip-flop cells in the technology library specified in the given liberty file.
dfflibmap -liberty NanGate_15nm_OCL_fast_conditional_ccs.lib
#dfflibmap -liberty fast.lib
opt

tee -o reports/top_timing.txt abc -D 10 -constr constraint.sdc -liberty NanGate_15nm_OCL_fast_conditional_ccs.lib -showtmp


# use ABC to map remaining logic to cells from the cell library
#abc -liberty fast.lib
abc -liberty NanGate_15nm_OCL_fast_conditional_ccs.lib
opt

# Print statistics 
#stat -liberty fast.lib
stat -liberty NanGate_15nm_OCL_fast_conditional_ccs.lib
# write synthesized design
write_verilog synth.v

#Create a graphviz DOT file
# show
