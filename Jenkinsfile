pipeline {
    agent any
    
    stages {
        stage('Input') {
            steps {
                script {
                    userInput = input(
                        id: 'userInput', message: 'Select an action to perform',
                        parameters: [
                            booleanParam(name: 'INIT', defaultValue: false, description: 'Initialize Terraform'),
                            booleanParam(name: 'APPLY', defaultValue: false, description: 'Apply Terraform resources'),
                            booleanParam(name: 'DESTROY', defaultValue: false, description: 'Destroy Terraform resources')
                        ]
                    )
                }
            }
        }
        
        stage('Terraform Initialization') {
            when {
                expression { userInput.INIT }
            }
            steps {
                script {
                    sh 'terraform init'
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
