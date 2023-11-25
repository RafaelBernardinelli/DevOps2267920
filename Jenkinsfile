pipeline{
    agent any

    stages {
        stage('Instalar as dependências') {
            steps {
                script {
                    sh 'docker-compose up -d'
                    sh 'npm install'
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

