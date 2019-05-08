pipeline {
    agent { label 'master' }
    stages {
        stage('Build Hardware') {
            steps {
                sh '''#!/bin/bash
                    /opt/Xilinx/Vivado/2015.4/settings64.sh
                    /opt/Xilinx/SDK/2015.4/settings64.sh
                    /opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source $WORKSPACE/vivado/build.tcl -tclargs testbuild
                '''
            }
        }
        stage('Generate Bitsream') {
            steps {
                sh '''#!/bin/bash
                    /opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source $WORKSPACE/vivado/generate_bitstream.tcl -tclargs testbuild
                '''
            }
        }
        stage('Export Hardware') {
            steps {
                sh '''#!/bin/bash
                    /opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source $WORKSPACE/vivado/export_hardware.tcl -tclargs testbuild
                '''
            }
        }

    }
    post { 
        always { 
            cleanWs()
        }
    }
}
