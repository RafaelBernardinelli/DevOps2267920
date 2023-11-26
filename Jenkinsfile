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

        stage('Install Dependencies') {
            steps {
                script {
                    // Instalar as dependências do projeto
                    sh 'npm install'
                }
            }
        }

        stage('Run Node.js Tests') {
            steps {
                script {
                    // Executar os testes Node.js
                    sh 'npm run test'
                }
            }
        }

    }

    post {
        always {
            // Limpar os recursos após a execução do pipeline
            script {
                // Executar o comando docker-compose down
                sh 'docker-compose down'
            }
        }
    }
}