pipeline {
  agent any
  stages {
    stage('Clone Repo') {
      steps {
        git branch: 'main', url: 'https://github.com/hazeem2004/task-tracker.git'
      }
    }
    stage('Install') {
      steps {
        sh 'npm install'
      }
    }
    stage('Test') {
      steps {
        sh 'npm test'
      }
    }
  }
}
