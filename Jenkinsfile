



pipeline {
    agent any

    environment {
        IMAGE_NAME = 'your-dockerhub-username/devops-cicd-demo'
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-username/devops-cicd-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                sh 'docker tag $IMAGE_NAME:$IMAGE_TAG $IMAGE_NAME:latest'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                sh 'docker push $IMAGE_NAME:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }

    post {
        always {
            sh 'docker logout || true'
        }
        success {
            echo 'CI/CD Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}

