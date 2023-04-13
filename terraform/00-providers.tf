terraform {
  required_version = ">= 0.13"

  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.14.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    
    helm = {
      source = "hashicorp/helm"
      version = "2.6.0"
    }

  }
}