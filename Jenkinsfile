pipeline {
    agent any
    
    triggers {
        pollSCM('*/5 * * * *')  // Check repo every 5 minutes
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Execute Script') {
            steps {
                sh 'chmod +x hello.sh'
                sh './hello.sh'
            }
        }
    }
    
    post {
    always {
        emailext (
            subject: "Jenkins Build: ${currentBuild.fullDisplayName}: ${currentBuild.result}",
            body: "Build URL: ${env.BUILD_URL}",
            to: 'naveen.v2304@gmail.com'
        )
    }
}
}