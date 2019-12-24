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

             stage('Test'){
                    steps{
                      sh 'mvn test'
                    }
                    post {
                        always {
                            junit 'target/surefire-reports/*.xml'
                        }
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
