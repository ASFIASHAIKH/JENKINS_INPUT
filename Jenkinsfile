pipeline {
    agent any
    
    stages {
        stage('Terraform Prompt') {
            steps {
                script {
                    def userInput = input(
                        id: 'userInput', message: 'Select Terraform action to perform',
                        parameters: [
                            choice(choices: ['apply', 'destroy'], description: 'Select Terraform action', name: 'TERRAFORM_ACTION')
                        ]
                    )
                    
                    // Accessing the user input using the correct field name
                    if (userInput.TERRAFORM_ACTION == 'apply') {
                        echo "Executing Terraform apply..."
                        sh 'terraform apply -auto-approve'
                    } else if (userInput.TERRAFORM_ACTION == 'destroy') {
                        echo "Executing Terraform destroy..."
                        sh 'terraform destroy -auto-approve'
                    } else {
                        error "Invalid option selected"
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
