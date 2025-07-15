pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/AtlantisAJ/rsschool-devops-course-tasks'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-app:latest .'
                }
            }
        }
    }
}
