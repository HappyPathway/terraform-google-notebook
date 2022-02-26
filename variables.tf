variable "project_id" {
  type = string
  description = "Project you want to create the Gitlab instance in"
  default = null
}

variable "region" {
  type = string
  description = "GCP region for resources"
  default = "us-central1"
}

variable "zone" {
  type = string
  description = "GCP zone for resources"
  default = "us-central1-a"
}

variable "machine_type" {
  type = string
  default = "e2-standard-8"
  description = "Type of machine GCP should use for your Gitlab Compute Instance"
}


variable "disk_size" {
  type = string
  default = 100
  description = "Size of BootDisk"
}

variable instance_count {
  type = number
  default = 1
}

variable network_name {
  default = "net-git-git"
}

variable subnetwork_name {
  default= "git-default"
}

variable owner {}

variable vm_image_project {
  default = "deeplearning-platform-release"
}

variable vm_image_family {
  default = "tf-latest-cpu"
}

variable notebook {
  description = "Name of Notebook"
}

variable install_gpu_driver {
  default = false
}

variable accelerator_type {
  default = null
}

variable accelerator_core_count {
  default = 1
}

variable container_repo {
  default = null
}

variable container_tag {
  default = "latest"
}

variable service_account {
  default = null
}