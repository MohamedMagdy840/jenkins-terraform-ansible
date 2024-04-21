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
                dir('/var/jenkins_home/workspace/terraform-ansible') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        
        stage('Run Ansible Playbook') {
            steps {
                dir('/var/jenkins_home/workspace/terraform-ansible') {
                    sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook main.yaml'
                }
            }
        }
    }
}
