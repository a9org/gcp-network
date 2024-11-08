data "google_compute_router_nat" "nat_gateway" {
  name = google_compute_router_nat.nat.name
  region = google_compute_router.nat_router.region
  router = google_compute_router.nat_router.name
}