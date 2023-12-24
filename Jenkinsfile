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
        /**
                     * login to docker for private repository
                     * create credentials in jenkins page.
                     **/
                     withCredentials([usernamePassword(credentialsId: 'docker-login-creds', passwordVariable: 'password', usernameVariable: 'username')]){
                         sh '''
                            echo "${password} | docker login -u ${username} --password-stdin"
                         '''
                         def app = docker.build("docker-image")
                         app.push("latest")
                     
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
