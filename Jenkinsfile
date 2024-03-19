pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the Git repository containing Terraform files
                git 'https://github.com/ASFIASHAIKH/JENKINS_INPUT.git'
            }
        }
        
        stage('Terraform Prompt') {
            steps {
                script {
                    def userInput = input(
                        id: 'userInput',
                        message: 'Select Terraform action to perform: apply or destroy'
                        parameters: [
                            choice(choices: ['apply', 'destroy'], description: 'Select Terraform action', name: 'TERRAFORM_ACTION')
                        ]
                    )
                }
            }
        }
        
        stage('Terraform init') {
            steps {
                script {
                sh 'terraform init'
            
                }
            }
        }
        
        stage('Terraform apply') { 
            steps {
                script {
                    // Execute Terraform Apply command based on user Input
                        sh 'terraform ${apply} --auto-approve'
                    }
                }
            }
        stage('Terraform destroy') { 
            steps {
                script {
                    // Execute Terraform Destroy command based on user Input
                        sh 'terraform ${destroy} --auto-approve'
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
