pipeline {
    agent any
    environment {
        BACKEND_IMAGE  = "iamprycedev/task-app-backend"
        FRONTEND_IMAGE = "iamprycedev/task-app-frontend"
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Build Backend Image') {
            steps {
                sh 'docker build -t $BACKEND_IMAGE:latest ./backend'
            }
        }
        stage('Build Frontend Image') {
            steps {
                sh 'docker build -t $FRONTEND_IMAGE:latest ./frontend'
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }
        stage('Push Images') {
            steps {
                sh '''
                    docker push $BACKEND_IMAGE:latest
                    docker push $FRONTEND_IMAGE:latest
                '''
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    sudo kubectl apply -f k8s/backend-deployment.yaml
                    sudo kubectl apply -f k8s/backend-service.yaml
                    sudo kubectl apply -f k8s/frontend-deployment.yaml
                    sudo kubectl apply -f k8s/frontend-service.yaml
                    sudo kubectl set image deployment/backend backend=$BACKEND_IMAGE:latest
                    sudo kubectl set image deployment/frontend frontend=$FRONTEND_IMAGE:latest
                '''
            }
        }
    }
}

