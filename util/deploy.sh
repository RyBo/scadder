#!/bin/bash

if [ $# -ne 2 ] 
then
    echo "Error: Missing Arguments"
    echo "Provide a name for the project"
    echo "Provide a path for the SD card"
    echo "ex: ./build.sh microblaze-ocm /media/sdcard"
    exit 1
fi

project_name=$1
petalinux_project_name = "petalinix-$project_name"
sd_path = $2

# create the petalinux project
petalinux-create --type project --template zynq --name $petalinux_project_name
cd $petalinux-project-name

# supply the directory with the hardware files and use the default project settings
echo "ESC" | petalinux-config --get-hw-description=build/$project_name.sdk/

# build the petalinux application
petalinux-build

# create the application boot files
petalinux-package --boot --fsbl sdk/FSBL/Debug/FSBL.elf --fpga build/$project_name.sdk/hw_platform/design_1_wrapper.bit --u-boot

# copy over to the SD Card
cp image/linux/BOOT.bin $sd_path
cp image/linux/image.ub $sd_path

echo "Petalinux project has been shipped to SD Card. Set the Zynq BOOT-MODE to 00110"
