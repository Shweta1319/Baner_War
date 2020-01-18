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
             
             stage('DeploytoTomcat'){
                    steps{
                        deploy adapters: [tomcat8(credentialsId: 'e428f82d-a9f6-4a5d-880e-8eb449625c8a', path: '', url: 'http://54.80.214.39:8080/')], contextPath: 'banerwar', war: '**/*.war'                    }
             }

    }
}
