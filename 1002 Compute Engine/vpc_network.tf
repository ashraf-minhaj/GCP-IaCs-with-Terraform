resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_network_name
  auto_create_subnetworks = true
  mtu                     = 1460
}

resource "google_compute_firewall" "vpc_firewall" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = [var.vpc_ssh_allow_tag] # <-- Only resources with this tag
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.vpc_allow_http_tag]
}