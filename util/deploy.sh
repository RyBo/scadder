#!/bin/bash

project-name = "microblaze-ocm"
petalinux-project-name = "zynq-poc-app"
SD-path = "/tmp"

# create the petalinux project
petalinux-create --type project --template zynq --name $petalinux-project-name
cd $petalinux-project-name
# supply the directory with the hardware files and use the default project settings
echo "ESC" | petalinux-config --get-hw-description=/home/abdullah/project_9/project_9.sdk/
# build the petalinux application
petalinux-build
# create the application boot files
petalinux-package --boot --fsbl sdk/FSBL/Debug/FSBL.elf --fpga build/$project-name.sdk/hw_platform/design_1_wrapper.bit --u-boot
# copy over to the SD Card
cp image/linux/BOOT.bin $SD-path
cp image/linux/image.ub $SD-path

echo "Petalinux project has been shipped to SD Card. Set the Zynq BOOT-MODE to 00110"
