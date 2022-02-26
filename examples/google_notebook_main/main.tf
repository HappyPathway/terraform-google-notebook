data "google_project" "sandbox_project" {
  project_id = var.project_id
}

data "google_compute_default_service_account" "default" {
}

resource "random_string" "random" {
  length = 8
  special = false
  upper = false
  number = false
}


### General Networking and Firewalls ###
resource "google_compute_network" "gitlab" {
  name                    = "net-git-${var.hostname}"
  project                 = var.project_id
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "gitlab-default" {
  provider = google-beta
  name          = "${var.hostname}-default"
  project                 = var.project_id
  ip_cidr_range = "10.1.2.0/24"
  region        = var.region
  network       = google_compute_network.gitlab.id
}

module "notebook" {
  source           = "../../"
  project_id       = var.project_id
  owner = "dave-cft@hawkfish.us"
  network_name = "testing"
  subnetwork_name = "testing"
  notebook = "davesnb"
  # container_repo = "gcr.io/deeplearning-platform-release/base-cpu"
}
          
output proxy_uri {
  value = module.notebook.proxy_uri
}
