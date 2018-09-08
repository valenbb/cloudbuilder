node {
	stage('Clone repository') {
        	checkout scm
    	}

	stage('Terraform Init') {
		sh '''
		  source /var/lib/jenkins/.bashrc
		'''
		sh 'terraform init -input=false'
	}
	
	stage('Terraform Plan') {
		sh 'terraform plan -input=false'
	}
	
	stage('Terraform Apply') {
		sh 'terraform apply -input=false -auto-approve'
	}
}
