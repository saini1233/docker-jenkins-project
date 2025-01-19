pipeline {
  agent any
  environment {
    DOCKER_IMAGE = "ubuntu"
    DOCKER_TAG = "javacode"
    WAR_FILE = "java-app.war"
    TOMCAT_IMAGE = "tomcat:latest"
  }
  stages {
    stage('Clone Repository') {
      steps {
        sh 'git clone -b main https://github.com/saini1233/docker-jenkins-project.git'
      }
    }
    stage('Build') {
      steps {
        dir('docker-jenkins-project') {
          sh 'mvn clean install -U'
        }
      }
    }
    stage('Build Docker image') {
      steps {
        script {
          sshagent(['dockerserver']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.83.105.94 "docker build -t $DOCKER_IMAGE:$DOCKER_TAG ."'
          }
        }
      }
    }
    stage('RUN Docker Container') {
      steps {
        script {
          sshagent(['dockerserver']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.83.105.94 "docker run -d --name container1 -v $WORKSPACE/$WAR_FILE:/usr/local/tomcat/webapps/ROOT.war $DOCKER_IMAGE:$DOCKER_TAG"'
          }
        }
      }
    }
  }
  // post {
  //   failure {
  //     mail to: 'your-email@example.com',
  //          subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
  //          body: "Something went wrong. Please check the Jenkins logs."
  //   }
  // }
}
