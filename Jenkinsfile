pipeline {
  agent any
  stages {
    stage('Install & Test') {
      steps {
        sh 'npm install'
        sh 'npm test'
      }
    }
    stage('Lint Check') {
      steps {
        sh 'npx eslint .'
      }
    }
    stage('Archive') {
      when {
        branch 'main'
      }
      steps {
        archiveArtifacts artifacts: '**/build/**'
      }
    }
  }
  post {
    failure {
      mail to: 'hazeemahmed2004@gmail.com',
           subject: "Build Failed",
           body: "The Jenkins build failed. Check logs."
    }
  }
}
