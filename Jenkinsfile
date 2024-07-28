pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/SH-code12/DevOps_task'            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    // Build Docker image
                    sh 'sudo docker build -t shahdelnassag/jenkins_pipeline .'
                }
            }
        }
        stage('Run Docker container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh 'sudo docker stop simple-container || true'
                    sh 'sudo docker rm simple-container || true'
                    // Run Docker container
                    sh 'sudo docker run -d --name test-container -p 5000:80 shahdelnassag/jenkins_pipeline'
                }
            }
        }
    }
}
