pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'Docker_cre'
        IMAGE_NAME = 'pavankumarm7/new_image'
    }
    stages {
        stage('Build Java Application') {
            steps {
                bat 'javac hello.java'
            }
        }

        stage('Run Java Program') {
            steps {
                bat 'java hello'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "Docker_cre",
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS')]) {
                    
                    
                    bat 'echo %PASS%| docker login -u %USER% --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push %IMAGE_NAME%:latest'
            }
        }
    }
}
