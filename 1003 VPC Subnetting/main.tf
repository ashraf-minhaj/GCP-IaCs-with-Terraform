terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.32.0"
    }
  }
}

provider "google" {
  region = var.gcp_region
  project = var.project_id
}