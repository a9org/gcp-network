resource "google_compute_network" "this" {
  name                    = "vpc-${local.prefix_name}"
  auto_create_subnetworks = false
}