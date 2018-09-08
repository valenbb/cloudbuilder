node {
	stage('Clone repository') {
        	checkout scm
    	}

	stage('Terraform Init') {
		sh 'source /var/lib/jenkins/.bashrc
		sh 'terraform init'
	}
	
	stage('Terraform Plan') {
		sh 'terraform plan'
	}
	
	stage('Terraform Apply') {
		sh 'terraform apply'
	}
}
