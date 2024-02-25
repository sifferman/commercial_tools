
onerror { quit -code 1; }
vlib work
vlog +define+SIM -sv -quiet -work work tb.sv

run -all
exit
