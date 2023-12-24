node {
     
     def app 
     stage('clone repository') {
      checkout scm  
    }
     stage('Build docker Image'){
      app = docker.build("kaxhif045/terminal")
    }
    

   

    stage('Push Image'){
       docker.withRegistry('docker_id', 'git_id') {            
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")   
   }
}
}
