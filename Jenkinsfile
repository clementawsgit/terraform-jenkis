pipeline {
   agent any
   environment {
       AWS_ACCESS_KEY_ID     = credentials('AKIAWCZC5ZCVWFTGYAOM')
       AWS_SECRET_ACCESS_KEY = credentials('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')
       TF_VAR_region         = 'us-east-1'
   }
   stages {
       stage('Checkout') {
           steps {
               // Checkout the code from your repository
               git 'https://github.com/clementawsgit/terraform-jenkis.git'
           }
       }
       stage('Terraform Init') {
           steps {
               script {
                   // Initialize Terraform
                   sh 'terraform init'
               }
           }
       }
       stage('Terraform Plan') {
           steps {
               script {
                   // Create a Terraform execution plan
                   sh 'terraform plan -out=tfplan'
               }
           }
       }
       stage('Terraform Apply') {
           steps {
               script {
                   // Apply the Terraform plan
                   sh 'terraform apply -auto-approve tfplan'
               }
           }
       }
   }
   post {
       success {
           echo 'EC2 Instance created successfully!'
       }
       failure {
           echo 'EC2 Instance creation failed.'
       }
   }
}
