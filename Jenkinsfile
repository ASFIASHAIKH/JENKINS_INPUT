pipeline {
    agent any
    
   environment {
        AWS_ACCESS_KEY_ID     = credentials('asfiya_Aws_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('asfiya_Aws_secret_key')
    }
    stages {
        stage('Terraform Initialization') {
            steps {
                script {
                    // Execute terraform init
                    sh 'terraform init'
                }
            }
        }

        stage('Input') {
            steps {
                script {
                    userInput = input(
                        id: 'userInput', message: 'Select an action to perform',
                        parameters: [
                            booleanParam(name: 'APPLY', defaultValue: false, description: 'Apply Terraform resources'),
                            booleanParam(name: 'DESTROY', defaultValue: false, description: 'Destroy Terraform resources')
                        ]
                    )
                }
            }
        }
        
        stage('Terraform') {
            steps {
                script {
                    if (userInput.APPLY && userInput.DESTROY) {
                        error('Both apply and destroy options cannot be selected. Please select only one.')
                    } else {
                        if (userInput.APPLY) {
                            sh 'terraform apply -auto-approve'
                        } else if (userInput.DESTROY) {
                            sh 'terraform destroy -auto-approve'
                        }
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