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


            stage('DeploytoNexus'){
                    steps{
                      sh 'mvn deploy'
                    }
             }
             
             stage('DeploytoTomcat'){
                    steps{
                      deploy adapters: [tomcat7(credentialsId: '1de8381f-0df6-4c36-99af-467ac731a2a7', path: '', url: 'http://18.222.185.192:9090/')], contextPath: 'target', war: 'java-tomcat-maven-example.war'
                    }
             }

    }
}
