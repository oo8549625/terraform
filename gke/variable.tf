variable "project" {
  description = "project id"
}

variable "credentials_file" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "kubeconfig_path" {
  default = "~/.kube/config"
}