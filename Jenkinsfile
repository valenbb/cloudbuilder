node {
	stage('Clone repository') {
        	checkout scm
    	}

	stage('Test TF') {
		sh 'terraform --version'
	}
	
	stage('Test AWS') {
		sh 'aws --version'
	}
	
	stage {
		sh 'chef -v'
	}

}
