
.SECONDARY:

sky130_fd_sc_hd__tt_025C_1v80.lib:
	wget https://raw.githubusercontent.com/efabless/skywater-pdk-libs-sky130_fd_sc_hd/master/timing/sky130_fd_sc_hd__tt_025C_1v80.lib

%.genus.v: %.sv sky130_fd_sc_hd__tt_025C_1v80.lib genus.tcl
	mkdir -p $*_genus_build
	TOP_MODULE=$* genus -files genus.tcl -log $*_genus_build/synth.log

clean_genus:
	rm -rf *.genus.v *_genus_build fv .rs_*.tstamp

%.vivado.v: %.sv vivado.tcl
	rm -rf $*
	TOP_MODULE=$* vivado -nolog -nojournal -mode tcl -source vivado.tcl

clean_vivado:
	rm -rf *.vivado.v *_vivado_build .Xil

%.db: %.lib lc_shell.tcl
	LIB_FILE=$* lc_shell -f lc_shell.tcl

%.dc.v: %.sv sky130_fd_sc_hd__tt_025C_1v80.db dc.tcl
	TOP_MODULE=$* design_vision -no_init -64bit -f dc.tcl -output_log_file dc_output.txt

clean_dc:

clean: clean_genus clean_vivado clean_dc
