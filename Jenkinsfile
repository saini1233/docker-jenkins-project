pipeline {
  agent any
  enivronment {
    DOCKER_IMAGE="ubuntu"
    DOCKER_TAG="javacode"
    WAR_FILE="java-app.war"
    TOMCAT_IMAGE="tomcat:latest"
  }
  stages {
    stage('checkout code') {
      steps {
        git 'https://github.com/saini1233/docker-jenkins-project.git'
      }
    }
    stage('Build Docker Image') {
      steps {
        script {
          sh 'mvn clean install -DskipTests'
        }
      }
    }
    stage('Build Docker image') {
      steps {
        script {
          sshagent([dockerserver]) {
            sh 'ssh -o StrictHostKeyCHecking=no ubuntu@54.83.105.94 "docker build -t $DOCKE_IMAGE:$DOCKER_TAG ."
          }
        }
      }
    }
    stage('RUN Docker Container') {
      script {
        sshagent([dockerserver]) {
            sh 'ssh -o StrictHostKeyCHecking=no ubuntu@54.83.105.94 "docker run -d --nmae container1 -v $WORKSPACE/$WAR_FILE:/usr/local/tomcat/webapps/ROOT.war $DOCKER_IMAGE:$DOCKER_TAG"
      }
    }
  }
}
