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
                sh 'cd $WORKSPACE && terraform init'
            }
        }
        
        stage('Terraform Apply') {
            steps {
                sh 'cd $WORKSPACE && terraform apply -auto-approve'
            }
        }
        
        stage('Debug') {
            steps {
                sh 'cd $WORKSPACE && ls -al' // Check files in workspace
                sh 'cd $WORKSPACE && cat main.yaml' // View contents of main.yaml
                sh 'cd $WORKSPACE && ping -c 5 <target_host>' // Ping target host for connectivity
            }
        }
        
        stage('Run Ansible Playbook') {
            steps {
                sh 'cd $WORKSPACE && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook main.yaml'
            }
        }
    }
}
