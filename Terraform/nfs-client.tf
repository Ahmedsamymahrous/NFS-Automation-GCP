resource "google_compute_instance" "nfs-client" {
  name         = "nfs-client-samy-tf"
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
