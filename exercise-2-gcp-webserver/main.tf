provider "google" {
  credentials = file("/root/google_access_29012024/kyndryl-terraform-29012024-d8b7338b0dcc.json")
  project = "kyndryl-terraform-29012024"
  region  = var.region
  zone    = var.zone
}

resource "google_compute_firewall" "web" {
  name    = "${var.tag}-fw"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.tag]
}

resource "google_compute_instance" "web" {
  name = "${var.tag}-vm"
  machine_type = var.size
  tags = [var.tag]
  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    access_config {
    }
  }

  metadata = {
    ssh-keys = "${var.user}:${file(var.pubkey)}"
  }
  metadata_startup_script =  file("./web.sh")
}

output "Public-IP" {
  value = google_compute_instance.web.network_interface[0].access_config[0].nat_ip
}
