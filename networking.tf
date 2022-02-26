data "google_netblock_ip_ranges" "health_checker_netblock_ranges" {
  range_type = "health-checkers"
}

data "google_netblock_ip_ranges" "iap_forwarder_netblock_ranges" {
  range_type = "iap-forwarders"
}


data "google_project" "project" {
  project_id = var.project_id
}

data "google_compute_network" "network" {
  project = var.project_id
  provider = google-beta
  name = var.network_name
}

data "google_compute_subnetwork" "subnetwork" {
  project = var.project_id
  name   = var.subnetwork_name
  region = var.region
}
