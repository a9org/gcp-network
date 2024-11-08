resource "google_compute_instance" "nat_server" {
  count        = var.nat_type == "natserver" && var.multi_az ? 3 : (var.nat_type == "natserver" ? 1 : 0)
  name         = "ec2-${locals.prefix_name}-nat-${count.index + 1}"
  machine_type = var.nat_instance
  zone         = "${var.region}${count.index % 3 + 1}-a"
  tags         = ["ec2-${locals.prefix_name}-nat-${count.index + 1}"]


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = element([for s in google_compute_subnetwork.subnets : s if s.labels.tier == "public"], count.index).name
    access_config {
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sysctl -w net.ipv4.ip_forward=1
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
  EOT

  labels = local.common_tags
}

resource "google_compute_router" "nat_router" {
  count   = var.nat_type == "natgateway" && var.multi_az ? 3 : (var.nat_type == "natgateway" ? 1 : 0)
  name    = "nat-${locals.prefix_name}-${count.index + 1}"
  region  = "${var.region}${count.index + 1}"
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "nat" {
  count                  = var.nat_type == "natgateway" && var.multi_az ? 3 : (var.nat_type == "natgateway" ? 1 : 0)
  name                   = "nat-${count.index + 1}"
  router                 = google_compute_router.nat_router[count.index].name
  region                 = "${var.region}${count.index + 1}"
  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  dynamic "subnetwork" {
    for_each = [for s in google_compute_subnetwork.private : s]
    content {
      name                    = subnetwork.value.name
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
  }
}
