terraform {
  required_version = ">1.0.0"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">2.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_kubernetes_cluster" "main" {
  name                = "DevOps-cluster"
  resource_group_name = "devops-rg"
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.main.kube_config.0.host
    username               = data.azurerm_kubernetes_cluster.main.kube_config.0.username
    password               = data.azurerm_kubernetes_cluster.main.kube_config.0.password
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.main.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.main.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.main.kube_config.0.cluster_ca_certificate)
  }
}