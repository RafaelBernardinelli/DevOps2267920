pipeline{
    agent any

    stages {
        stage('Instalar as dependências') {
            steps {
                script {
                    sh 'npm install'
                    sh 'docker-compose up -d'
                }
            }
        }
        stage('Testes') {
            steps {
                script {
                    sh 'npm run test'
                    sh 'npm run test:ci'
                    sh 'npm run test:e2e'
                }
            }
        }
    }
}