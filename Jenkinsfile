pipeline {
    agent any 
    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform Action')
    }
    stages {
        stage('Terraform Execution') { 
            steps {
                script {
                    // Execute Terraform command based on user Input
                    if {params.ACTION == 'apply'}  {
                        sh 'terraform apply -auto-approve'
                    } else {params.ACTION == 'destroy'} {
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
