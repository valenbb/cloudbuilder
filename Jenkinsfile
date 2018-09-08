node {
    try {
        notifyBuild('STARTED')

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
        } catch (e) {
    	      // If there was an exception thrown, the build failed
    		currentBuild.result = "FAILED"
    		throw e
  		} finally {
    		// Success or failure, always send notifications
    		notifyBuild(currentBuild.result)
                } 
}

def notifyBuild(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESSFUL'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"
  def details = """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
    <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>"""

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESSFUL') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary)
}
