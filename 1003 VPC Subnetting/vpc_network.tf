resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_network_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

# Subnets themselves don't have "public" or "private" flags like AWS.
# Subnet is just a range of IP addresses inside a region — whether a VM is public or private depends on:
# If the VM gets an external (public) IP ➔ it's "public".
# If the VM only has internal IP ➔ it's "private".

resource "google_compute_subnetwork" "subnet_tf_id" {
  name                     = "${var.vpc_network_name}-${var.subnet_name}"
  ip_cidr_range            = var.subnet_cidr
  region                   = var.gcp_region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true # VMs without public IPs can still access Google APIs/services (like Cloud Storage, BigQuery, etc.) through internal IP.
}