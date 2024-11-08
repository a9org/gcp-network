resource "google_compute_route" "private_route" {
  count = contains(var.subnets, "private") ? 3 : 0

  name              = "rtb-${local.prefix_name}-private-${count.index + 1}"
  network           = google_compute_network.this.id
  dest_range        = "0.0.0.0/0"
  next_hop_instance = var.nat_type == "natserver" && var.multi_az ? google_compute_instance.nat_server[count.index].self_link : (var.nat_type == "natserver" ? google_compute_instance.nat_server[0].self_link : null)
  next_hop_gateway  = var.nat_type == "natgateway" && var.multi_az ? google_compute_router_nat.nat[count.index].id : (var.nat_type == "natgateway" ? google_compute_router_nat.nat[0].id : null)
  priority          = 1000
  depends_on = [
    google_compute_instance.nat_server,
    google_compute_router_nat.nat
  ]
}
