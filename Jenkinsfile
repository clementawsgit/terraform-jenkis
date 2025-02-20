pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION = 'us-east-1'
    }
    
    stages {
        stage('Checkout') {
            steps {
                
                git 'https://github.com/clementawsgit/terraform-jenkis.git'  
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    
                    sh 'terraform init'
                }
            }
        }

        stage('Plan Terraform') {
            steps {
                script {
                    
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    
                    
                }
            }
        }
    }

    post {
        always {
            
            cleanWs()
        }
        success {
            
            echo 'EC2 instance created successfully!'
        }
        failure {
            
            echo 'Terraform execution failed.'
        }
    }
}
