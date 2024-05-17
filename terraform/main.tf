# Fichier : main.tf

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

# Déclaration du provider Kubernetes
#provider "kubernetes" {
 # config_path = "~/.kube/config"
#}

#provider "kubernetes" {
 # config_path = "C:/Users/HP/.kube/config"
#}

provider "kubernetes" {
  config_path = "C:\\Users\\USER\\.kube\\config"
}


# Récupération du contenu YAML pour le déploiement PHP
resource  "kubernetes_manifest" "db-base" {
  manifest = yamldecode(file("../mysql_deploy.yml"))
  
}

# Récupération du contenu YAML pour le déploiement PHP
resource  "kubernetes_manifest" "db" {
  manifest = yamldecode(file("../mysql_serv.yml"))
  
}

# Récupération du contenu YAML pour le déploiement PHP
resource  "kubernetes_manifest" "app-base" {
  manifest = yamldecode(file("../php_deploy.yml"))
  
}

# Récupération du contenu YAML pour le déploiement PHP
resource  "kubernetes_manifest" "app-service" {
  manifest = yamldecode(file("../php_serv.yml"))
  
}