#3.36.0

resource "google_notebooks_instance" "vm_instance" {
  count = var.container_repo == null ? var.instance_count : 0
  provider = google-beta
  project = var.project_id
  name = var.notebook
  location = var.zone
  machine_type = var.machine_type

  instance_owners = [var.owner]
  service_account = local.service_account

  install_gpu_driver = var.install_gpu_driver
  dynamic "accelerator_config" {
    for_each = var.accelerator_type == null ? [] : [1]
    content {
      type = var.eccelerator_type
      core_count = var.accelerator_core_count
    }
  }

  vm_image {
    project      = var.vm_image_project
    image_family = var.vm_image_family
  }

  boot_disk_type = "PD_SSD"
  boot_disk_size_gb = var.disk_size

  no_public_ip = false
  no_proxy_access = false

  network = data.google_compute_network.network.id
  subnet = data.google_compute_subnetwork.subnetwork.id

  metadata = {
    terraform = "true"
  }
}
