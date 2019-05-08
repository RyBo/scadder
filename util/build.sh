#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Error: Missing Argument"
    echo "Provide a name for the project"
    echo "ex: ./build.sh microblaze-ocm"
    exit 1
fi

project_name=$1
/opt/Xilinx/Vivado/2015.4/settings64.sh
/opt/Xilinx/SDK/2015.4/settings64.sh

# build the vivado hardware project
#/opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source vivado/build.tcl -tclargs $project_name

# generate the bitstream
#/opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source vivado/generate_bitstream.tcl -tclargs $project_name

# export hardware
/opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source vivado/export_hardware.tcl -tclargs $project_name

# build the sdk project
/opt/Xilinx/SDK/2015.4/bin/xsdk -batch -source sdk/build_project.tcl $project_name
