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
        
        stage('Sleep for 5 minutes') {
            steps {
                // Sleep for 5 minutes (300 seconds)
                sleep time: 60, unit: 'SECONDS'
                echo 'Woke up after 1 minute!'
            }
        }


        stage('Run Ansible Playbook') {
            steps {
                sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook main.yaml'
            }
        }
    }
}
