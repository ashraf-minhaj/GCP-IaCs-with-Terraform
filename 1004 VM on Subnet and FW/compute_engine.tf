# resource "google_service_account" "default" {
#   account_id   = "my-custom-sa"
#   display_name = "Custom SA for VM Instance"
# }


resource "google_compute_instance" "vm" {
  name         = var.compute_engine_name
  machine_type = var.compute_engine_machine_type
  zone         = var.compute_engine_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
      architecture = var.compute_engine_arch
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet1.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  tags = [var.vpc_ssh_allow_tag, var.vpc_allow_http_tag] # if this tag matches, it will be ssh accessible

  metadata_startup_script = "sudo apt-get install nginx -y"

  #   service_account {
  #     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #     email  = google_service_account.default.email
  #     scopes = ["cloud-platform"]
  #   }
}