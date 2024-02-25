
.SECONDARY:

sky130_fd_sc_hd__tt_025C_1v80.lib:
	wget https://raw.githubusercontent.com/efabless/skywater-pdk-libs-sky130_fd_sc_hd/master/timing/sky130_fd_sc_hd__tt_025C_1v80.lib

clean: clean_synopsys clean_cadence clean_siemens clean_xilinx


# Synopsys

%.db: %.lib lc_shell.tcl
	mkdir -p $*_lc_build
	LIB_FILE=$* lc_shell -f lc_shell.tcl -no_log -output_log_file $*_lc_build/lc_output.txt

%.dc.v: %.sv sky130_fd_sc_hd__tt_025C_1v80.db dc.tcl
	mkdir -p $*_dc_build
	TOP_MODULE=$* design_vision -no_init -64bit -no_log -f dc.tcl -output_log_file $*_dc_build/dc_output.txt

vcs_%: %.f
	vcs -ful64 -sverilog -assert svaext -file $< && ./simv

clean_synopsys:
	rm -rf *_lc_build
	rm -rf test.dc.v *_dc_build
	rm -rf simv ucli.key vc_hdrs.h simv.daidir csrc


# Cadence

%.genus.v: %.sv sky130_fd_sc_hd__tt_025C_1v80.lib genus.tcl
	mkdir -p $*_genus_build
	TOP_MODULE=$* genus -files genus.tcl -log $*_genus_build/synth.log

xcelium_%: %.f
	xrun -f $<

clean_cadence:
	rm -rf *.genus.v *_genus_build fv .rs_*.tstamp
	rm -rf xrun.history xrun.log xcelium.d


# Siemens

modelsim:
	vsim -c -do "do modelsim.tcl; exit" tb

clean_siemens:
	rm -rf work transcript


# Xilinx

%.vivado.v: %.sv vivado.tcl
	rm -rf $*
	TOP_MODULE=$* vivado -nolog -nojournal -mode tcl -source vivado.tcl

clean_xilinx:
	rm -rf *.vivado.v *_vivado_build .Xil
