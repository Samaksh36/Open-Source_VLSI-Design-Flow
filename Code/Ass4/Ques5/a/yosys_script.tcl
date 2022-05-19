#reading the technology library specified in the given liberty file.
read_liberty -lib bonus_edited.lib
# read_liberty -lib NanGate_15nm_OCL_worst_low_conditional_nldm.lib

# reading the design using the Verilog frontend (icarus Verilog)
# read_verilog : Load modules from a Verilog file to the current design
#NOTE: in case of multiple .v files each file should be read individually
read_verilog Q5.v
hierarchy -top Q5

# convert high-level behavioral parts ("processes") to d-type flip-flops and muxes
proc 
# perform some simple optimizations
opt

# convert high-level memory constructs to d-type flip-flops and multiplexers
memory  
opt

# convert design to (logical) gate-level netlists
techmap
opt

# technology mapping of flip-flops
#Map internal flip-flop cells to the flip-flop cells in the technology library specified in the given liberty file.
dfflibmap -liberty bonus_edited.lib
# dfflibmap -liberty NanGate_15nm_OCL_worst_low_conditional_nldm.lib
opt

# use ABC to map remaining logic to cells from the cell library
abc -liberty bonus_edited.lib
# abc -liberty NanGate_15nm_OCL_worst_low_conditional_nldm.lib
opt

# Print statistics 
stat -liberty bonus_edited.lib
# stat -liberty NanGate_15nm_OCL_worst_low_conditional_nldm.lib

# write synthesized design
write_verilog synth.v

#Create a graphviz DOT file
show
