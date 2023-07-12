pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World 2'
            }
        }
        stage('Shell1') {
            steps {
                sh 'terraform init'
            }
        }
        
    }
}
