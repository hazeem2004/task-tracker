pipeline {
    agent any

    environment {
        NODE_ENV = 'development'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/hazeem2004/task-tracker.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Static Code Analysis') {
            steps {
                sh 'npx eslint .'
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
                body: "Build failed! Check Jenkins."
            )
        }
    }
}
