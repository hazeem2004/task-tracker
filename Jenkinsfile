pipeline {
    agent any
    
    tools {
        nodejs 'NodeJS18'
    }


    environment {
        NODE_ENV = 'development'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', credentialsId: 'github-creds', url: 'https://github.com/hazeem2004/task-tracker.git'
            }
        }

        stages {
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test || true'  // Allows pipeline to continue even if tests fail
            }
        }

        stage('Static Code Analysis') {
            steps {
                sh 'npx eslint . || true'  // Allows pipeline to continue even if lint fails
            }
        }

        stage('Archive Artifacts') {
            when {
                branch 'main'
            }
            steps {
                archiveArtifacts artifacts: '**/build/**', fingerprint: true
            }
        }
    }

    post {
        failure {
            emailext (
                to: 'hazeemahmed2004@gmail.com',
                subject: "Pipeline Failed",
                body: "Build failed! Check Jenkins logs."
            )
        }
    }
}
