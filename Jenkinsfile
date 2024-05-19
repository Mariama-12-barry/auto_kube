pipeline {
    agent any
    environment {
        // Assurez-vous que ce chemin mène à votre kubeconfig local généré par Minikube
        KUBECONFIG = "C:/Users/USER/.kube/config"
        // Chemin où se trouvent vos fichiers Terraform dans votre projet
        TERRA_DIR = "C:\Users\USER\Desktop\ODC\ODC\devops_aws_cheikh\terraform"
    }
    stages {
        stage('Initialization') {
            steps {
                // Affiche la version de Terraform pour le débogage
                script {
                    bat 'terraform --version'
                }
            }
        }
        
        stage("Terraform Init") {
            steps {
                script {
                    // Initialise Terraform
                    bat "cd %TERRA_DIR% && terraform init"
                }
            }
        }
        
        stage("Terraform Plan") {
            steps {
                script {
                    // Exécute le plan Terraform
                    bat "cd %TERRA_DIR% && terraform plan"
                }
            }
        }
        
        stage("Terraform Apply") {
            steps {
                script {
                    // Applique la configuration Terraform
                    bat "cd %TERRA_DIR% && terraform apply --auto-approve"
                }
            }
        }
    }
    post {
        always {
            script {
                // Nettoie l'environnement après l'exécution du pipeline
                bat "cd %TERRA_DIR% && terraform destroy --auto-approve"
            }
        }
        success {
            // Envoyer un email de succès si le déploiement est réussi
            emailext (
                subject: "Notification de build Jenkins - Succès",
                body: "Le build de votre pipeline Jenkins s'est terminé avec succès.",
                to: "mbmariamabarry1@gmail.com"
            )
        }
        failure {
            // Envoyer un email d'échec si l'exécution échoue
            emailext (
                subject: "Notification de build Jenkins - Échec",
                body: "Le build de votre pipeline Jenkins a échoué.",
                to: "mbmariamabarry1@gmail.com"
            )
        }
    }
}
