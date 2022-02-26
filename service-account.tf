resource "google_service_account" "sa" {
  count = var.service_account == null ? 1 : 0
  project = var.project_id
  account_id   = "${var.notebook}-${random_string.random.result}"
  display_name = var.notebook
}

resource "random_string" "random" {
  length = 8
  special = false
  upper = false
  number = false
}


resource "google_service_account_iam_binding" "admin-account-iam" {
  count = var.service_account == null ? 1 : 0
  service_account_id = google_service_account.sa.0.name
  role               = google_project_iam_custom_role.notebook.0.name

  members = ["user:${var.owner}"]
  
}

resource "google_project_iam_custom_role" "notebook" {
  count = var.service_account == null ? 1 : 0
  project = var.project_id
  role_id     = "${var.notebook}${random_string.random.result}"
  title       = var.notebook
  description = var.notebook
  permissions = [
    "bigquery.readsessions.create",
    "bigquery.readsessions.getData",
    "bigquery.readsessions.update",
    "resourcemanager.projects.get",
    "serviceusage.services.use"
  ]
}

locals {
  service_account = var.service_account == null ? google_service_account.sa.0.email : var.service_account
}

output service_account {
  value = local.service_account
}