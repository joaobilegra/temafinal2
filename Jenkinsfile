pipeline{
    agent any
    stages{
        stage('run job1'){
         steps{
            build job: 'build'
          }
      }
       stage('Run job2'){
         steps{
                build job: 'deploy'
                
            }
        }    
    }
    
}
    
