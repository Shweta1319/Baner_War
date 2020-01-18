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
                        deploy adapters: [tomcat8(credentialsId: '1de8381f-0df6-4c36-99af-467ac731a2a7', path: '', url: 'http://54.80.214.39:8080/')], contextPath: 'banerwar', war: '**/*.war'                    }
             }

    }
}
