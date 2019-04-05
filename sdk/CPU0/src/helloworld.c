/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include <unistd.h>
#include <xil_io.h>


// OCM memory used to communicate with CPU0
#define RT1_VAL (*(volatile u32 *)(0x40000000))
#define RT2_VAL (*(volatile u32 *)(0x42000000))

// OCM memory used to communicate with CPU0
#define DRAM1_VAL (*(volatile u32 *)(0x00000000))
#define DRAM2_VAL (*(volatile u32 *)(0x10000000))

int main()
{
	DRAM2_VAL = 0;
    init_platform();
    char buf1[300];
    char buf2[100];
    char buf3[100];

    xil_printf("FS : Initialized\n\r");
    while(1) {
    	sprintf(buf1, "FS : RT1_VAL = %u ", RT1_VAL);
    	sprintf(buf2, " : RT2_VAL = %u   ", RT2_VAL);
    	sprintf(buf3, " : SM_VAL = %u \n\r",DRAM1_VAL);
    	strcat(buf1, buf2);
    	strcat(buf1, buf3);
    	xil_printf(buf1);
    	DRAM2_VAL ++;
    	sleep(2);
    	cleanup_platform();
    }
    return 0;
}
