pipeline {
    agent any
    
    triggers {
        pollSCM('*/5 * * * *')  // Check repo every 5 minutes
    }
    
    options {
        // Add timeout to prevent pipeline from hanging indefinitely
        timeout(time: 1, unit: 'HOURS')
        // Discard old builds to save disk space
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
                from: 'naveenkumar@whitemastery.com',
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
                from: 'naveenkumar@whitemastery.com',
                attachLog: true
            )
        }
        
    }
}