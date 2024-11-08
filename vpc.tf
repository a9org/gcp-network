resource "google_compute_network" "this" {
  name                   = "vpc-${locals.prefix_name}"
  auto_create_subnetworks = false
}