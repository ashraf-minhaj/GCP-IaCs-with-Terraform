variable "gcp_region" {
  default = "us-central1"
}

variable "project_id" {
  #   default = "My First Project"
  default = "utility-cathode-451011-t4"
}

variable "vpc_network_name" {
  default = "test-min-vpc"
}

variable "subnet_name" {
  default = "subnet1"
}

variable "subnet_cidr" {
  default = "10.1.0.0/24"
}

variable "vpc_ssh_allow_tag" {
  default = "allow-ssh"
}

variable "vpc_allow_http_tag" {
  default = "local-vm"
}

variable "compute_engine_name" {
  default = "vm1-running-container"
}

variable "compute_engine_zone" {
  default = "us-central1-c"
}

variable "compute_engine_machine_type" {
  default     = "e2-micro"
  description = "micro - 1GB, e2-small (2 vCPUs, 2 GB Memory)"
}

variable "compute_engine_arch" {
  default = "X86_64"
}