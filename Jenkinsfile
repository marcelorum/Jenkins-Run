pipeline {

    agent any

    environment {
  		PASS = credentials('registry-pass')
    }

    stages {

        stage('Build') {
            steps {
                sh '''
			./var/jenkins_home/pipeline/pipeline/jenkins/build/mvn.sh mvn -B -DskipTests clean package
			./var/jenkins_home/pipeline/pipeline/jenkins/build/build.sh
           
                    '''   
            }
            post {
                success {
                    archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                }
            }

        }                        
        stage('Test') {
            steps {
		sh './jenkins/test/test.sh mvn test' 
            }
            post {
                always {
                    junit 'java-app/target/surefire-reports/*.xml'
                }
	    }

        }
        stage('Push') {
            steps {
		sh '/var/jenkins_home/pipeline/pipeline/jenkins/push/push.sh'
            }
        }
        stage('Deploy') {
            steps {
       		sh '/var/jenkins_home/pipeline/pipeline/jenkins/deploy/deploy.sh'
            }
        }
    }
}
