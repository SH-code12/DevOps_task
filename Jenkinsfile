pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/SH-code12/DevOps_task'
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t shahdelnassag/jenkins .'
                }
            }
        }
        stage('Run Docker container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh 'docker stop simple-container || true'
                    sh 'docker rm simple-container || true'
                    // Run Docker container
                    sh 'docker run -d --name simple-container -p 5000:80 shahdelnassag/jenkins'
                }
            }
        }
    }
}
