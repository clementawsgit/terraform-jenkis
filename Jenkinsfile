pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AKIAWCZC5ZCVWFTGYAOM')  
        AWS_SECRET_ACCESS_KEY = credentials('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')  
        AWS_DEFAULT_REGION = 'us-east-1'  
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the Terraform configuration from your Git repository
                git 'https://github.com/clementawsgit/terraform-jenkis.git' 
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    // Initialize the Terraform working directory
                    sh 'terraform init'
                }
            }
        }

        stage('Plan Terraform') {
            steps {
                script {
                    // Run Terraform plan to show execution plan
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    // Apply the Terraform plan to create the EC2 instance
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after execution
            cleanWs()
        }
        success {
            // Notify on successful EC2 creation
            echo 'EC2 instance created successfully!'
        }
        failure {
            // Handle failure
            echo 'Terraform execution failed.'
        }
    }
}
