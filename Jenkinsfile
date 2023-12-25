pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('docker_id')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t kaxhif045/terminal:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push kaxhif045/terminal:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
