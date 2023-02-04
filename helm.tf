provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "nginx" {
  name      = "nginx"
  namespace = "default"
  repository = "https://charts.bitnami.com/bitnami"
  chart     = "nginx"
  version   = "13.2.23"
  timeout   = 1800
  wait_for_jobs = true
  values = [
    "${file("nginx-values.yaml")}"
  ]
}