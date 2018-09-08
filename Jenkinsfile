node {
	stage('Clone repository') {
            checkout scm
    	}

	stage('Terraform Init') {
	    sh 'terraform init -input=false'
	}

	stage('Terraform Plan') {
             withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_KEY_ID']]) {
                sh 'export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}'
	       	sh 'AWS_SECRET_KEY=${AWS_SECRET_ACCESS_KEY}'
	        sh 'terraform plan -input=false'
	    }
	}
	
	stage('Terraform Apply') {
	    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_KEY_ID']]) {
                sh 'export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}'
                sh 'AWS_SECRET_KEY=${AWS_SECRET_ACCESS_KEY}'
	        sh 'terraform apply -input=false -auto-approve'
	    }
	}
}
