pipeline {
    agent any
    
    stages {
        stage('Prompt User') {
            steps {
                script {
                    userInput = input(
                        message: 'Select Terraform action:',
                        parameters: [
                            choice(choices: ['Apply', 'Destroy'], description: 'Select Terraform action')
                        ]
                    )
                }
            }
        }
        stage('Execute Terraform') {
            steps {
                script {
                    if (userInput == 'Apply') {
                        sh 'terraform apply -auto-approve'
                    } else if (userInput == 'Destroy') {
                        sh 'terraform destroy -auto-approve'
                    } else {
                        error 'Invalid option selected'
                    }
                }
            }
        }
    }
    post { 
        always { 
            echo 'Deleting Project now !! '
            deleteDir()
        }
    
    }

}