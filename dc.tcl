
read_file -format sverilog -rtl $::env(TOP_MODULE).sv

set current_design $::env(TOP_MODULE)
set link_library sky130_fd_sc_hd__tt_025C_1v80.db
set target_library sky130_fd_sc_hd__tt_025C_1v80.db

link

compile

write_file -format verilog -output $::env(TOP_MODULE).dc.v

exit
