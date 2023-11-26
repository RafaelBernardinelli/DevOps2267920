pipeline {
    agent any

    stages {
        stage('Build and Run Docker Image') {
            steps {
                script {
                    // Definir o nome da imagem Docker
                    def dockerImage = 'nome-da-sua-imagem-docker:latest'

                    // Construir a imagem Docker
                    docker.build(dockerImage, '--file Dockerfile .')

                    // Executar o contêiner Docker
                    docker.image(dockerImage).withRun('-e NODE_ENV= -e MONGODB_URI=mongodb://mongo:27017/nodegoat -p 4000:4000') {
                        // Aguarde o contêiner estar pronto para aceitar conexões
                        sh 'until nc -z -w 2 mongo 27017; do sleep 2; done'

                        // Execute o script de reinicialização do banco de dados e inicie o aplicativo
                        sh 'npm run db-reset && npm start'
                    }
                }
            }
        }
    }
}
