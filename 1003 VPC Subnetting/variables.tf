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