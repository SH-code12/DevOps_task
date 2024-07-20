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
                    // Assuming Dockerfile is in the root of the repository
                    sh 'docker build -t shahdelnassag/jenkins .'
                }
            }
        }
    }
}
