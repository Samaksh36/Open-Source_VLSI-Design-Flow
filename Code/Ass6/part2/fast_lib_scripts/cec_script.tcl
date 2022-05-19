#Source: Google Classroom Assignment-6 (Given)

#gold design
read_verilog des1.v
read_liberty -ignore_miss_func -ignore_miss_data_latch fast.lib
#If we don't use the above method we get miter design instantiation error.
design -save lib
prep -flatten -top des1
splitnets -ports;;
design -stash gold

#####################################################################################

#gate design
read_verilog des2.v
read_liberty -ignore_miss_func -ignore_miss_data_latch fast.lib
#If we don't use the above method we get miter design instantiation error.
prep -flatten -top des2
splitnets -ports;;
design -stash gate

#####################################################################################

design -copy-from gold -as gold des1
design -copy-from gate -as gate des2

#prove combinational equivalence checking
miter -equiv -flatten gold gate miter
prep -flatten -top miter

#design -save lib
dfflibmap -liberty fast.lib
abc -liberty fast.lib
techmap -map %lib
clk2fflogic

show -prefix equiv-prep -colors 1 -stretch
sat -all -verify -tempinduct -prove trigger 0 -set-at 1 in_in 0

#####################################################################################
