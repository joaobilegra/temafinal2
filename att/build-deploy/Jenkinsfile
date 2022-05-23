pipeline {
    agent any
    stages {
        stage ('Build image docker') {
            steps {
                sh 'docker build -t app-java .'
               
             }
         }
         stage('Run container'){
            steps{
                sh 'docker run --restart unless-stopped -dti -p 8080:8080 --name app-java app-java'
            }
        }
    } 

}
