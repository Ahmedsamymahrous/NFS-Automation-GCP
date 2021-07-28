resource "google_compute_instance" "jenkins" {
  name         = "jenkins-samy-tf"
  machine_type = "e2-medium"
  tags = ["port8080"]
  allow_stopping_for_update = true 
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
