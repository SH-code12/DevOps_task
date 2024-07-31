pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    }

    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/SH-code12/DevOps_task'
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t shahdelnassag/jenkins_pipeline .'
                }
            }
        }
        stage('Run Docker container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh 'docker stop jenkins-container || true'
                    sh 'docker rm jenkins-container || true'
                    // Run Docker container
                    sh 'docker run -d --name jenkins-container -p 5000:80 shahdelnassag/jenkins_pipeline'
                }
            }
        }
        stage('Push Docker image') {
            steps {
                script {
                    // Log in to Docker Hub using token
                    sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
                    // Tag the Docker image
                    sh 'docker tag shahdelnassag/jenkins_pipeline shahdelnassag/jenkins_pipeline:latest'
                    // Push the Docker image
                    sh 'docker push shahdelnassag/jenkins_pipeline:latest'
                }
            }
        }
    }
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
