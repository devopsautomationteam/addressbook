pipeline {
    
    agent { label 'dkrmgt2' }
    stages {
	   
        stage ('Checkout') {
          steps {
            git 'https://github.com/devopsautomationteam/addressbook.git'
          }
        }
        stage('Build') {
            
             steps {
               
               sh '/opt/apache-maven-3.6.3/bin/mvn clean install'
                //junit '**/target/surefire-reports/TEST-*.xml'
		archiveArtifacts artifacts: '**/target/*.war', fingerprint: true
            }
        }
        stage('Docker image') {
        
            steps {
                
                sh 'docker build -t devopsautomationteam/addressbook$(git rev-parse HEAD):latest .'
            }
    }
        stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: '33d3cc68-1f1a-4b17-a9be-202e6eff6884', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push devopsautomationteam/addressbook$(git rev-parse HEAD):latest'
        }
      }
    }
        stage('Docker Deploy') {
       
      steps {
          sh 'docker run -itd -P devopsautomationteam/addressbook$(git rev-parse HEAD):latest'
        }
      }
    
    }
    
}
