#!/bin/bash

/opt/Xilinx/Vivado/2015.4/settings64.sh
/opt/Xilinx/SDK/2015.4/settings64.sh

# build the vivado hardware project
/opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source vivado/build.tcl

# generate the bitstream
/opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source vivado/generate_bitstream.tcl

# build the sdk project
/opt/Xilinx/SDK/2015.4/bin/xsdk -batch -source sdk/build_project.tcl
