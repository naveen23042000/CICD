pipeline {
    agent any
    
    triggers {
        pollSCM('*/5 * * * *')  
    }
    
    options {
        timeout(time: 1, unit: 'HOURS')
        buildDiscarder(logRotator(numToKeepStr: '10'))
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
        success {
            emailext (
                subject: "Pipeline Success: ${currentBuild.fullDisplayName}",
                body: """
                    Build completed successfully!
                    
                    Build URL: ${env.BUILD_URL}
                    Job Name: ${env.JOB_NAME}
                    Build Number: ${env.BUILD_NUMBER}
                """,
                to: 'naveen.v2304@gmail.com',
                attachLog: true
            )
        }
        failure {
            emailext (
                subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
                body: """
                    Build failed!
                    
                    Build URL: ${env.BUILD_URL}
                    Job Name: ${env.JOB_NAME}
                    Build Number: ${env.BUILD_NUMBER}
                """,
                to: 'naveen.v2304@gmail.com',
                attachLog: true
            )
        }
    }
}