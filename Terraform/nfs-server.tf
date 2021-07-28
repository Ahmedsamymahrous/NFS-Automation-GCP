resource "google_compute_instance" "nfs-server" {
  name         = "nfs-server-samy-tf"
  machine_type = "e2-medium"
  metadata = {
      ssh-keys = "ahmed:${file("/home/ahmed/.ssh/id_rsa.pub")}"
  }

  boot_disk {
    initialize_params {
      image = "centos-7-v20210420"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_attached_disk" "ext-disk" {
  disk     = google_compute_disk.external-disk.id
  instance = google_compute_instance.nfs-server.id
}

