# gold desgin
read_verilog nan_des1.v
read_liberty -lib NanGate_15nm_OCL_worst_low_conditional_nldm.lib
prep -flatten -top nan_des1
splitnets -ports;;
design -stash gold

# gate design
read_verilog nan_des2.v
read_liberty -lib NanGate_15nm_OCL_worst_low_conditional_nldm.lib
prep -flatten -top nan_des2
splitnets -ports;;
design -stash gate

design -copy-from gold -as gold nan_des1
design -copy-from gate -as gate nan_des2

# prove combinational equivalence checking
miter -equiv -flatten gold gate miter
prep -flatten -top miter
show -prefix equiv-prep -colors 1 -stretch
sat -all -verify -tempinduct -prove trigger 0 -set-at 1 in_IN 01
