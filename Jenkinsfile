pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerc'
        IMAGE_NAME = 'pavankumarm7/new_docker_image'
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
                    credentialsId: "${DOCKERHUB_CREDENTIALS}",
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS')]) {
                    
                    // FIX: No space between %PASS% and |
                    // The ( ) ensures only the variable content is echoed
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
