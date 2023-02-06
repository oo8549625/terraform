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

# resource "helm_release" "minio" {
#   name      = "minio"
#   namespace = "default"
#   create_namespace = true
#   repository = "https://charts.bitnami.com/bitnami"
#   chart     = "minio"
#   version   = "12.1.3"
#   timeout   = 300
#   wait_for_jobs = true
#   values = [
#     "${file("minio-values.yaml")}"
#   ]
#   cleanup_on_fail = true
# }

# resource "helm_release" "loki" {
#   name      = "loki-distributed"
#   namespace = "default"
#   create_namespace = true
#   repository = "https://grafana.github.io/helm-charts"
#   chart     = "loki-distributed"
#   version   = "0.69.4"
#   timeout   = 1800
#   reuse_values = true
#   wait = true
#   wait_for_jobs = true
#   values = [
#     "${file("loki-values.yaml")}"
#   ]
#   cleanup_on_fail = true
# }