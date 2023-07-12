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
        stage('Shell2') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('start') {
            steps {
                sh 'terraform apply'                
            }
        }
    }
}
