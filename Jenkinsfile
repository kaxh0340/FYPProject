pipeline {
  environment {
    registry = "kaxhif045/terminal"
    registryCredential = 'docker_id'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/kaxh0340/FYPProject.git'
      }
    }

    stage('Building image') {
      steps {
        script {
          dockerImage = docker.build("${registry}:${BUILD_NUMBER}")
        }
      }
    }

    stage('Test Mkdocs') {
      agent {
        docker { image "${registry}:${BUILD_NUMBER}" }
      }
      steps {
        // Add steps for testing Mkdocs inside the Docker container
      }
    }

    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Remove Unused docker image') {
      steps {
        sh "docker rmi ${registry}:${BUILD_NUMBER}"
      }
    }
  }
}
