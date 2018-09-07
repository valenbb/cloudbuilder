node {
	stage('Clone repository') {
        	checkout scm
    	}

	stage('Test TF') {
		sh 'terraform --version'
	}
	
	stage('Test AWS') {
		sh 'aws ec2 describe-keypairs'
	}
	
	stage('Test Chef') {
		sh 'chef -v'
	}

}
