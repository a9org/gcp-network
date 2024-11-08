resource "google_compute_subnetwork" "public" {
  count = contains(var.subnets, "public") ? 3 : 0

  name          = "sbn-${local.prefix_name}-public-${count.index}"
  ip_cidr_range = format("%s.%s.%s/%s", element(local.CIDR, 0), element(local.CIDR, 1), var.subnet_tier_public[count.index], "24")
  region        = var.region
  network       = google_compute_network.this.id
}

resource "google_compute_subnetwork" "private" {
  count = contains(var.subnets, "private") ? 3 : 0

  name          = "sbn-${local.prefix_name}-private-${count.index}"
  ip_cidr_range = format("%s.%s.%s/%s", element(local.CIDR, 0), element(local.CIDR, 1), var.subnet_tier_private[count.index], "24")
  region        = var.region
  network       = google_compute_network.this.id
}

resource "google_compute_subnetwork" "restrict" {
  count = contains(var.subnets, "restrict") ? 3 : 0

  name          = "sbn-${local.prefix_name}-restrict-${count.index}"
  ip_cidr_range = format("%s.%s.%s/%s", element(local.CIDR, 0), element(local.CIDR, 1), var.subnet_tier_restrict[count.index], "24")
  region        = var.region
  network       = google_compute_network.this.id
}