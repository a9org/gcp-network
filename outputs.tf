output "vpc_id" {
    description = "VPC ID"
    value = google_compute_network.this.id
}

output "subnets_public" {
    description = "Public Subnets"
    value = google_compute_subnetwork.public.*.id
}

output "subnets_private" {
    description = "Private Subnets"
    value = google_compute_subnetwork.private.*.id
}

output "subnets_restric" {
    description = "Restricted Subnets"
    value = google_compute_subnetwork.private.*.id
}

output "nat_public_ips" {
    description = "NAT Public IPs"
    value = (var.nat_type == "natserver") ? google_compute_address.nat.*.address : google_compute_router_nat.nat.*.nat_ip   
}