##Source: Google Classroom Assignment-6 (Given)


#gold design
read_verilog des1.v
read_liberty -lib fast.lib
read_liberty -ignore_miss_func -ignore_miss_data_latch fast.lib
prep -flatten -top des1
splitnets -ports;;
design -stash gold

##############################################################################

#gate design
read_verilog des2.v
read_liberty -lib fast.lib
read_liberty -ignore_miss_func -ignore_miss_data_latch fast.lib
prep -flatten -top des2
splitnets -ports;;
design -stash gate

##############################################################################

design -copy-from gold -as gold des1
design -copy-from gate -as gate des2

##############################################################################

#prove sequential equivalence checking
equiv_make gold gate equiv
prep -flatten -top equiv
opt_clean -purge

show -prefix equiv-prep -colors 1 -stretch
equiv_induct -seq 5
equiv_status -assert

#############################################################################
