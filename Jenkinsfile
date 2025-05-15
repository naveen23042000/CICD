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
        success {
            emailext (
                subject: "Pipeline Success: ${currentBuild.fullDisplayName}",
                body: """
                    Build completed successfully!
                    
                    Build URL: ${env.BUILD_URL}
                    
                    Build Log:
                    ${currentBuild.rawBuild.getLog(20).join('\n')}
                """,
                to: 'your-email@example.com',
                from: 'jenkins@your-domain.com'
            )
        }
        failure {
            emailext (
                subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
                body: """
                    Build failed!
                    
                    Build URL: ${env.BUILD_URL}
                    
                    Build Log:
                    ${currentBuild.rawBuild.getLog(20).join('\n')}
                """,
                to: 'your-email@example.com',
                from: 'jenkins@your-domain.com'
            )
        }
    }
}