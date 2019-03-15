pipeline {
    agent { label 'master' }
    stages {
        stage('Build Hardware') {
            steps {
                sh '''#!/bin/bash
                    /opt/Xilinx/Vivado/2015.4/settings64.sh
                    /opt/Xilinx/SDK/2015.4/settings64.sh
                    /opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source $WORKSPACE/vivado/build.tcl
                '''
            }
        }
        stage('Generate Bitsream') {
            steps {
                sh '''#!/bin/bash
                    /opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source $WORKSPACE/vivado/generate_bitstream.tcl
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
