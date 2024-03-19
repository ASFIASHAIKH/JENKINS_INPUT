pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = ''
        AWS_SECRET_ACCESS_KEY = ''
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    stages {
        stage('Environment Variables') {
            steps {
                script {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'asfiya_AWS',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    ]]) {
                        // Credentials will be automatically injected into environment variables
                    }
                }
            }
        }

        stage('Terraform Execution') {
            steps {
                script {
                    // Terraform initialization
                    echo 'Initializing Terraform...'
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Action') {
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
