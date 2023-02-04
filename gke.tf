terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
    
    helm = {
      source = "hashicorp/helm"
      version = "2.8.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_service_account" "sa" {
  account_id = "gke-cluster-sa"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "terraform-subnetwork"
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

resource "google_container_cluster" "cluster" {
  name               = "gke-cluster"
  location           = var.region
  initial_node_count = 1
  remove_default_node_pool = "true"
  min_master_version = "1.25.4"
  subnetwork         = google_compute_subnetwork.subnetwork.name
  network            = google_compute_network.vpc_network.name
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "terraform-node-pool"
  cluster    = google_container_cluster.cluster.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-small"
    service_account = google_service_account.sa.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    disk_size_gb = 10
    disk_type    = "pd-standard"
  }

  lifecycle {
    create_before_destroy = true
  }
}