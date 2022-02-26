locals {
   proxy_uri = var.container_repo == null ? google_notebooks_instance.vm_instance.0.proxy_uri : google_notebooks_instance.container_instance.0.proxy_uri
}

output proxy_uri {
  value = "${var.notebook}:: ${local.proxy_uri}"
}
