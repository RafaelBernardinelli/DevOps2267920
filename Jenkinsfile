pipeline {
    agent any

    stages {
        stage('Build and Run Docker Compose') {
            steps {
                script {
                    // Executar o comando docker-compose up
                    sh 'docker-compose up -d'
                }
            }
        }
    }
}