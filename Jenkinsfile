pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')  // Jenkins credential for AWS access key
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')  // Jenkins credential for AWS secret key
        AWS_DEFAULT_REGION = 'us-east-1'  // The AWS region to use
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the Terraform configuration from your repository
                git 'https://github.com/clementawsgit/terraform-jenkis.git'  // Your repo containing Terraform scripts
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    // Initialize Terraform working directory
                    sh 'terraform init'
                }
            }
        }

        stage('Plan Terraform') {
            steps {
                script {
                    // Run Terraform plan to see the execution plan
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    // Apply the Terraform plan to create the EC2 instance(s)
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Optional: Run `terraform destroy` to tear down resources
                    // sh 'terraform destroy -auto-approve'
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
            // Notify on successful deployment
            echo 'EC2 instance created successfully!'
        }
        failure {
            // Handle failures
            echo 'Terraform execution failed.'
        }
    }
}
