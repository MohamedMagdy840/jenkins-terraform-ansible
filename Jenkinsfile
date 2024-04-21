pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your Git repository to a directory named 'my-repo'
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Navigate to Terraform directory
                    dir('my-repo') {
                        // Initialize Terraform
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Navigate to Terraform directory
                    dir('my-repo') {
                        // Apply Terraform changes
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                script {
                    // Navigate to Ansible directory
                    dir('my-repo') {
                        // Run Ansible playbook
                        sh 'ansible-playbook main.yaml'
                    }
                }
            }
        }
    }
}
