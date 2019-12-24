pipeline {

    agent {
      label "master"
     }
          
    tools {
       maven 'Maven' 
       jdk 'Java'      
    }
    
    stages {
            stage('Build') {
                    steps {
                        sh 'mvn install'
                    }
           }


            stage('Deploy'){
                    steps{
                      sh 'mvn deploy'
                    }
             }
             
             stage('Sonar'){
                    steps{
                      sh 'mvn sonar:sonar'
                    }
             }

    }
}
