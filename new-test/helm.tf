terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.8.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "nginx" {
  name      = "nginx"
  namespace = "default"
  create_namespace = true
  repository = "https://charts.bitnami.com/bitnami"
  chart     = "nginx"
  version   = "13.2.23"
  timeout   = 1800
  wait_for_jobs = true
  values = [
    "${file("nginx-values.yaml")}"
  ]
  cleanup_on_fail = true
}