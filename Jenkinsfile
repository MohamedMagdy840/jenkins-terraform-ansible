pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/MohamedMagdy840/jenkins-terraform-ansible'
            }
        }
        
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        
        stage('Debug') {
            steps {
                sh 'cd $WORKSPACE && ls -al' // Check files in workspace
                sh 'cd $WORKSPACE && cat main.yaml' // View contents of main.yaml
            }
        }
        
        stage('Run Ansible Playbook') {
            steps {
                sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook main.yaml'
            }
        }
    }
}
