pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'task_6', url: 'https://github.com/atlantisaj/rsschool-devops-course-tasks'
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
