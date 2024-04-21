pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/MohamedMagdy840/jenkins-terraform-ansible'
            }
        }
        
        stage('Terraform Init & Apply') {
            steps {
                dir('$WORKSPACE') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        
        stage('Run Ansible Playbook') {
            steps {
                dir('$WORKSPACE') {
                    sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook main.yaml'
                }
            }
        }
    }
}
