pipeline {
    agent any
    
    stages {
        stage('Run HTTP Server') {
            steps {
                script {
                    // Stop existing HTTP server if it's running
                    sh 'pkill -f "python3 -m http.server" || true'

                    // Clone git submodule
                    sh 'git submodule update --init --recursive'

                    // Start a simple HTTP server
                    sh 'python3 -m http.server 2556 --bind 0.0.0.0 --cgi &'


                    // Sleep for a few seconds to allow the server to start
                    sleep(time: 10, unit: 'SECONDS')
                }
            }
     
    }
}
