resource "google_compute_disk" "external-disk" {
  name  = "nfs-disk-samy-tf"
  zone  = "us-central1-a"
  size = 10
  physical_block_size_bytes = 4096
}