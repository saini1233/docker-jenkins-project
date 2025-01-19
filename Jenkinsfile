pipeline {
  agent any
  enivronment {
    DOCKER_IMAGE="ubuntu"
    DOCKER_TAG="javacode"
    WAR_FILE="/target/"
    TOMCAT_IMAGE="tomcat:latest"
  }
  stages {
    stage('checkout code') {
      steps {
        git ''
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
          sh '''
          docker build -t $DOCKE_IMAGE:$DOCKER_TAG .
          '''
        }
      }
    }
    stage('RUN Docker Container') {
      script {
        sh '''
        docker run -d --nmae container1 -v $WORKSPACE/$WAR_FILE:/usr/local/tomcat/webapps/ROOT.war $DOCKER_IMAGE:$DOCKER_TAG
        '''
      }
    }
  }
}
