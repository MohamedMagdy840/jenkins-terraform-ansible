pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Check out the code from the Git repository, using 'main' branch
                git branch: 'main', url: 'https://github.com/MohamedMagdy840/jenkins-terraform-ansible'
            }
        }
        
        stage('Terraform Init & Apply') {
            steps {
                // Run terraform init and apply from the main directory
                sh '''
                    cd $WORKSPACE
                    terraform init
                    terraform apply -auto-approve
                '''
            }
        }
        
        stage('Run Ansible Playbook') {
            steps {
                // Run ansible playbook from the root directory
                sh 'ansible-playbook main.yml'
            }
        }
    }
}
