node {
     def app 
    
     stage('clone repository') {
      checkout scm  
    }
     stage('Build docker Image'){
      app = docker.build("kaxhif045/terminal")
    }
    

   

   stage('Push Image') {
    withDockerRegistry([credentialsId: 'docker_id', url: 'https://registry.hub.docker.com']) {
        app.push("${env.BUILD_NUMBER}")
        app.push("latest")
    }
}

}
