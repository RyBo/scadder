# Processing System Monitor over Microblaze

This project was designed to implement a way for Microblaze to monitor specific memory regions of a
Real Time Operating System, as well as report any kinds of malicious activity. In addition, it was
meant to be run in an environment that supported the MIL-STD-1553 protocol.

Hardware & SDK
===
[Xilinx Zynq ZC706](http://www.xilinx.com/zc706)

[Vivado 2015.4](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html)

Building
===
To build the hardware design as well as importing the Xilinx SDK source code applications, run the following command
```
$ ./util/build.sh
```

To manually build, see the wiki page: https://github.com/RyBo/scadder/wiki/Building

Customizing
===
If you wish to make changes to the block design in Vivado, you must export the new block design file and ensure it matches the vivado build file specified in: ```vivado/build.tcl``` 
See https://github.com/RyBo/scadder/wiki/Updating-the-Block-Design


Project layout 
===
```
vivado
├── build.tcl
├── export_hardware.tcl
├── generate_bitstream.tcl
└── src
    ├── bd
    │   └── design_1.tcl
    └── hdl
sdk
├── build_project.tcl
├── CPU0
│   ├── Debug
│   │   ├── CPU0.elf
│   │   ├── CPU0.elf.size
│   │   ├── makefile
│   │   ├── objects.mk
│   │   ├── sources.mk
│   │   └── src
│   │       ├── CPU0.d
│   │       ├── CPU0.o
│   │       ├── platform.d
│   │       ├── platform.o
│   │       └── subdir.mk
│   └── src
│       ├── helloworld.c
│       ├── lscript.ld
│       ├── platform.c
│       ├── platform_config.h
│       └── platform.h
├── CPU1
│   └── Debug
│       ├── CPU1.elf
│       ├── CPU1.elf.size
│       ├── makefile
│       ├── objects.mk
│       ├── sources.mk
│       └── src
│           ├── CPU1.d
│           ├── CPU1.o
│           ├── platform.d
│           ├── platform.o
│           └── subdir.mk
├── MB0
│   └── src
│       ├── helloworld.c
│       ├── lscript.ld
│       ├── platform.c
│       ├── platform_config.h
│       └── platform.h
├── RT1
│   └── src
│       ├── lscript.ld
│       └── testperiph.c
└── RT2
    └── src
        ├── lscript.ld
        └── testperiph.c
util
├── build.sh
├── deploy.sh
└── spoof-mac
```
