pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "iamprycedev/task-app"
    }

    stages {

        stage('Install Dependencies') {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Verify Environment') {
            steps {
                dir('backend') {
                    sh 'node -v'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t task-app .'
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh 'docker tag task-app $DOCKER_IMAGE:latest'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker push $DOCKER_IMAGE:latest'
            }
        }
    }
}