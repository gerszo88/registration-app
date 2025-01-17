pipeline {
  agent any
  tools{
    jdk 'Java17'
    maven 'Maven3'
  }
  environment{
    APP_NAME = "register-app-pipeline"
    RELEASE = "1.0.0"
    DOCKER_USER = "gerszo88"
    DOCKER_PASS = 'Dockerhub'
    IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
    IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
    registry = "gerszo88/test"
  }
  stages{
    stage("Cleanup Workspace"){
      steps{
        cleanWs()
      }
    }
    stage("Checkout from SCM"){
      steps {
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/gerszo88/registration-app.git'
      }
    }
    stage("Build Application"){
      steps {
        sh "mvn clean package"
      }
    }
    stage("Test Application"){
      steps {
        sh "mvn test"
      }
    }
    stage("SonarQube"){
      steps{
        script{
          withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token'){
            sh "mvn sonar:sonar"
          }
        }
      }
    }
    stage("Quality Gate"){
      steps{
        script{
          waitForQualityGate abortPipeline:false,credentialsId: 'jenkins-sonarqube-token'
        }
      }
    }
    stage("Build & Push Docker Image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com',DOCKER_PASS) {
                        docker_image = docker.build ("${IMAGE_NAME}")
                    }
                    docker.withRegistry('https://registry.hub.docker.com',DOCKER_PASS) {
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push('latest')
                    }
                }
            }
    }
  }
}
