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

        stage('Run CI Tests') {
            steps {
                script {
                    // Executar os testes de CI
                    sh 'npm run test:ci'
                }
            }
        }

        stage('Run E2E Tests') {
            steps {
                script {
                    // Executar os testes E2E
                    sh 'npm run test:e2e'
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