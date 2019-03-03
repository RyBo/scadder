#!/bin/bash

/opt/Xilinx/Vivado/2015.4/settings64.sh
# build the project
/opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source vivado/build.tcl
# generate the bitstream
/opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source vivado/implement.tcl
