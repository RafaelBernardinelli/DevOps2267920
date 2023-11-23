pipeline{
    agente any

    stages {
        stage('Build TADS') {
            steps {
                sh '''
                    docker info
                    java --version
                    docker compose version
                '''
            }
        }
    }
}