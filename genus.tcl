
set nproc [exec nproc]
set_multi_cpu_usage -local_cpu $nproc

read_hdl -language sv -library work $::env(TOP_MODULE).sv

read_libs sky130_fd_sc_hd__tt_025C_1v80.lib

elaborate
syn_generic $::env(TOP_MODULE)
syn_map

write_hdl > $::env(TOP_MODULE).genus.v

exit
