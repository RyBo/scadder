pipeline {
    agent { label 'master' }
    stages {
        stage('build hardware') {
            steps {
                 bash '''#!/bin/bash
                    ./opt/Xilinx/Vivado/2015.4/settings64.sh
                    ./opt/Xilinx/SDK/2015.4/settings64.sh
                    ./opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source $WORKSPACE/vivado/build.tcl
                '''
            }
        }
        stage('generate bitsream') {
            steps {
                bash '''#!/bin/bash
                    ./opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source $WORKSPACE/vivado/generate_bitstream.tcl
                '''
            }
        }
        stage('import sdk') {
            steps {
                bash '''#!/bin/bash
                    ./opt/Xilinx/SDK/2015.4/bin/xsdk -batch -source $WORKSPACE/sdk/build_project.tcl
                '''
 
            }
        }
    }
}
