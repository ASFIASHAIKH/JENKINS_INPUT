pipeline {
    agent any

    stages {
        stage('Example') {
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

        stage('Terraform init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Apply') { 
            when {
                expression { userInput.TERRAFORM_ACTION == 'apply' }
            }
            steps {
                script {
                    // Execute Terraform Apply command based on user Input
                    sh 'terraform apply --auto-approve'
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
