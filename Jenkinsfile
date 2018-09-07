node {
	stage('Clone repository') {
        	checkout scm
    	}

	stage('Test TF') {
		sh 'terraform --version'
	}
	
	stage('Test AWS') {
		sh '/usr/local/bin/aws --version'
	}
}
