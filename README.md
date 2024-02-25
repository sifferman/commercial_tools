# Build Scripts for Commercial SystemVerilog Tools

## Tool Usage

The following files are provided as examples:

* `"test.sv"`
* `"tb.sv"`
* `"tb.f"`

```bash
# replace `test` with the basename of your own systemverilog file
make test.genus.v
make test.dc.v
make test.vivado.v

# replace `tb` with the basename of your own .f file
make xcelium_tb
make vcs_tb
# edit modelsim.tcl
make modelsim
```

## Tool Locations

### Synopsys

```bash
# Design Compiler
PATH=$PATH:$SYNOPSYS_ROOT/syn/$DC_VERSION/bin

# Libary Compiler
PATH=$PATH:$SYNOPSYS_ROOT/lc/$LC_VERSION/bin

# VCS
PATH=$PATH:$SYNOPSYS_ROOT/vcs/$VCS_VERSION/bin
```

### Cadence

```bash
# Xcelium
PATH=$PATH:$CADENCE_ROOT/XCELIUM$XCELIUM_VERSION/tools/xcelium/bin/64bit

# Genus
PATH=$PATH:$CADENCE_ROOT/GENUS$GENUS_VERSION/bin
```

### Siemens

```bash
# ModelSim
PATH=$PATH:$SIEMENS_ROOT/ModelSimSE-$MODELSIM_VERSION/modeltech/bin
```

### Xilinx

```bash
# Vivado
source $XILINX_ROOT/Vivado/$VIVADO_VERSION/settings64.sh
```
