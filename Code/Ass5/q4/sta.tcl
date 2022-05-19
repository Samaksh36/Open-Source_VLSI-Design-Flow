read_liberty fast.lib
read_verilog top.v
link_design top
read_sdc constraint.sdc
report_worst_slack -max
report_worst_slack -min
report_checks -path_delay min_max
report_checks -path_delay min_max > reports.txt
