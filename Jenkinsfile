pipeline {
    agent any

    stages {
        stage('Prepare Workspace') {
            steps {
                // Checkout the Git repository containing Terraform files
                git 'https://github.com/ASFIASHAIKH/JENKINS_INPUT.git'
            }
        }
    
    stages {
        stage('Terraform Prompt') {
            steps {
                script {
                    def userInput = input(
                        id: 'userInput',
                        message: 'Select Terraform action to perform',
                        parameters: [
                            choice(choices: ['apply', 'destroy'], description: 'Select Terraform action', name: 'TERRAFORM_ACTION')
                        ]
                    )
                }
            }
        }
        
        stage('Terraform Actions') { 
            steps {
                script {
                    // Execute Terraform command based on user Input
                    if (params.ACTION == 'apply') {
                        sh 'terraform apply -auto-approve'
                    } else if (params.ACTION == 'destroy') {
                        sh 'terraform destroy -auto-approve'
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
