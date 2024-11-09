output "vpc_id" {
  description = "VPC ID"
  value       = google_compute_network.this.id
}

output "vpc_self_link" {
  description = "VPC Self Link"
  value       = google_compute_network.this.self_link
}

output "subnets_public" {
  description = "Public Subnets"
  value       = google_compute_subnetwork.public.*.id
}

output "subnets_private" {
  description = "Private Subnets"
  value       = google_compute_subnetwork.private.*.id
}

output "subnets_restric" {
  description = "Restricted Subnets"
  value       = google_compute_subnetwork.private.*.id
}

output "subnets_public_self_link" {
  description = "Public Subnets Self Link"
  value       = google_compute_subnetwork.public.*.self_link
}

output "subnets_private_self_link" {
  description = "Private Subnets Self Link"
  value       = google_compute_subnetwork.private.*.self_link
}

output "subnets_restrict_self_link" {
  description = "Restricted Subnets Self Link"
  value       = google_compute_subnetwork.private.*.self_link
}

output "nat_public_ips" {
  description = "NAT Public IPs"
  value       = (var.nat_type == "natserver") ? google_compute_instance.nat_server.*.network_interface.0.access_config.0.nat_ip : google_compute_router_nat.nat.*.nat_ips
}