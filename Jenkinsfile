pipeline {
    agent any

    stages {
        stage('Get Terraform Configuration') {
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
        
        echo "User input: ${userInput}"
         
        stage('Terraform Actions') { 
            steps {
                script {
                    // Execute Terraform command based on user Input
                    if ("${userInput}" == 'apply' ||  {
                        sh 'terraform ${userInput} -auto-approve'
                    } else if "${userInput}" == 'destroy') {
                        sh 'terraform ${userInput} -auto-approve'
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
