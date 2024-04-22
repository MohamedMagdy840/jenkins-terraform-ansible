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


//note
// we can run each stage in different agent if we want each stage using different version of same package like python
//for example if stage need python2 and another one need python3 so, we can run each stage in different agent that have 
//this version of this package 
