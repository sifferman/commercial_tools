
create_project $::env(TOP_MODULE) ./$::env(TOP_MODULE)_vivado_build -part xc7a100tcsg324-1

add_files -norecurse $::env(TOP_MODULE).sv
set_property top_file $::env(TOP_MODULE).sv [current_fileset]

set nproc [exec nproc]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value {-mode out_of_context} -objects [get_runs synth_1]
launch_runs synth_1 -jobs $nproc
wait_on_run synth_1
open_run synth_1 -name synth_1

write_verilog -force -include_xilinx_libs $::env(TOP_MODULE).vivado.v

exit
