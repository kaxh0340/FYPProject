node {
     def app 
     stage('clone repository') {
      checkout scm  
    }
     stage('Build docker Image'){
      app = docker.build("kaxhif045/terminal")
    }
     // Example Docker login step in Jenkins pipeline
     stage('Docker Login') {
         withCredentials([usernamePassword(credentialsId: 'docker_id', usernameVariable: 'dockerhub', passwordVariable: 'dockerhub')]) {
             sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
    }
}

    stage('Test Image') {
    app.inside {
        sh 'pwd'
        sh 'ls -la'
        sh 'echo "TEST PASSED"'
         }
     }

    stage('Push Image'){
       docker.withRegistry('https://registry.hub.docker.com', 'git') {            
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")   
   }
}
}
