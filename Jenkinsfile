pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials("AWS_ACCESS_KEY_ID")
        AWS_SECRET_ACCESS_ID = credentials("AWS_SECRET_ACCESS_ID")
        AWS_DEFAULT_REGION = 'ap-south-1'
        }
        
        stage('Debug Credentials') {
            steps {
                echo "AWS_ACCESS_KEY_ID: ${env.AWS_ACCESS_KEY_ID}"
                echo "AWS_SECRET_ACCESS_KEY: ${env.AWS_SECRET_ACCESS_KEY}"
                echo "AWS_DEFAULT_REGION: ${env.AWS_DEFAULT_REGION}"
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

        stage('Terraform Prompt') {
            steps {
                script {
                    userInput = input(
                        message: 'Select Terraform action to perform: apply or destroy',
                        parameters: [
                            choice(name: 'TERRAFORM_ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform action..')
                        ]
                    )
                }
            }
        }

        stage('Terraform Apply/Destroy') {
            steps {
                script {
                    // Execute Terraform Apply or Destroy based on user input
                    if (userInput == 'apply') {
                        sh 'terraform apply -auto-approve'
                    } else if (userInput == 'destroy') {
                        sh 'terraform destroy -auto-approve'
                    } else {
                        error "Invalid option selected: ${userInput}"
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            deleteDir()
        }
    }
}
