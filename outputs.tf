output "vpc_id" {
    description = "VPC ID"
    value = google_compute_network.this.id
}

output "subnets_public" {
    description = "Public Subnets"
    value = google_compute_subnetwork.subnet_public.*.id
}

output "subnets_private" {
    description = "Private Subnets"
    value = google_compute_subnetwork.subnet_private.*.id
}

output "subnets_restric" {
    description = "Restricted Subnets"
    value = google_compute_subnetwork.subnet_restricted.*.id
}