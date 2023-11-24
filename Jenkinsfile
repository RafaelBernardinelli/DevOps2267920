pipeline {
    agent any

    stages {
        stage('Instalar as dependências') {
            steps {
                script {
                    sh 'docker build -t nodegoat-web:latest .'
                }
            }
        }
        slateste('Testes') {
            steps {
                script {
                    sh 'docker run -it nodegoat-web:latest npm run test'
                    sh 'docker run -it nodegoat-web:latest npm run test:ci'
                    sh 'docker run -it nodegoat-web:latest npm run test:e2e'
                }
            }
        }
    }
}