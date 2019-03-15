pipeline {
    agent { label 'master' }
    stages {
        stage('build hardware') {
            steps {
                checkout scm
                sh 'ls'
                sh 'ls /'
                sh 'ls /opt/'
                sh '/opt/Xilinx/Vivado/2015.4/settings64.sh'
                sh '/opt/Xilinx/SDK/2015.4/settings64.sh'
                sh '/opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source $WORKSPACE/vivado/build.tcl'
            }
        }
        stage('generate bitsream') {
            steps {
                sh '/opt/Xilinx/Vivado/2015.4/bin/vivado -mode batch -source $WORKSPACE/vivado/generate_bitstream.tcl'
            }
        }
        stage('import sdk') {
            steps {
                sh '/opt/Xilinx/SDK/2015.4/bin/xsdk -batch -source $WORKSPACE/sdk/build_project.tcl'
            }
        }
    }
}
