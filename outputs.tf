# output "vpc_id" {
#     description = "VPC ID"
#     value = google_compute_network.this.id
# }

# output "subnets_public" {
#     description = "Public Subnets"
#     value = google_compute_subnetwork.public.*.ID
# }

# output "subnets_private" {
#     description = "Private Subnets"
#     value = google_compute_subnetwork.private.*.ID
# }

# output "subnets_restric" {
#     description = "Restricted Subnets"
#     value = google_compute_subnetwork.private.*.ID
# }