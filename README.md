# Processing System Monitoring over Microblaze

This project was designed to implement a way for Microblaze to monitor specific memory regions of a
Real Time Operating System, as well as report any kinds of malicious activity. In addition, it was
meant to be run in an environment that supported the MIL-STD-1553 protocol.

Building
===
To build the hardware design as well as importing the Xilinx SDK source code applications, run the following command
```
$ ./util/build.sh
```

Hardware & SDK
===
[Xilinx Zynq ZC706](http://www.xilinx.com/zc706)

[Vivado 2015.4](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html)

Project layout 
===
```
├── sdk
│   ├── build_project.tcl
│   ├── CPU0
│   │   └── src
│   │       ├── helloworld.c
│   │       ├── lscript.ld
│   │       ├── platform.c
│   │       ├── platform_config.h
│   │       └── platform.h
│   ├── MB0
│   │   └── src
│   │       ├── helloworld.c
│   │       ├── lscript.ld
│   │       ├── platform.c
│   │       ├── platform_config.h
│   │       └── platform.h
│   ├── RT1
│   │   └── src
│   │       ├── lscript.ld
│   │       └── testperiph.c
│   └── RT2
│       └── src
│           ├── lscript.ld
│           └── testperiph.c
├── util
│   └── build.sh
└── vivado
    ├── build.tcl
    ├── generate_bitstream.tcl
    └── src
        └── bd
            └── design_1.tcl
```
