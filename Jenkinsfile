node {
     def app 
     environment {
     registryCredential = 'docker_id'
     }
     stage('clone repository') {
      checkout scm  
    }
     stage('Build docker Image'){
      app = docker.build("kaxhif045/terminal")
    }
    

   

    stage('Push Image'){
       docker.withRegistry('registryCredential', 'git_id') {            
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")   
   }
}
}
