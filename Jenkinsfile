pipeline {
    agent any 
    
    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform Action')
    }
    
    stages {
        stage('Terraform Apply') { 
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        // Execute Terraform apply command
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
        
        stage('Terraform Destroy') {
            steps {
                script {
                    if (params.ACTION == 'destroy') {
                        // Execute Terraform destroy command
                        sh 'terraform destroy -auto-approve'
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
