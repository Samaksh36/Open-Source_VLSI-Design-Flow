#reading the technology library specified in the given liberty file.
#read_liberty -lib fast.lib
read_liberty -lib fast.lib 
# reading the design using the Verilog frontend (icarus Verilog)
# read_verilog : Load modules from a Verilog file to the current design
#NOTE: in case of multiple .v files each file should be read individually
read_verilog des1.v
hierarchy -top des1

# convert high-level behavioral parts ("processes") to d-type flip-flops and muxes
proc 

# perform some simple optimizations
opt


# Resource Sharing
# share -force


# convert high-level memory constructs to d-type flip-flops and multiplexers
memory
opt

# convert design to (logical) gate-level netlists
techmap
opt

# technology mapping of flip-flops
#Map internal flip-flop cells to the flip-flop cells in the technology library specified in the given liberty file.
dfflibmap fast.lib
#dfflibmap -liberty fast.lib
opt

# use ABC to map remaining logic to cells from the cell library
#abc -liberty fast.lib
abc -liberty fast.lib
opt

# Print statistics 
#stat -liberty fast.lib
stat -liberty fast.lib
# write synthesized design
write_verilog synth.v

#Create a graphviz DOT file
show des1
