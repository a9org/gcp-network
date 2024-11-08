locals {
  common_tags = {
    owner       = var.owner
    project     = var.project
    environment = var.environment
  }

  prefix_name = "${var.project}-${var.environment}"

  zonas = ["-a","-b","-c"]

  CIDR = split(".", var.cidr)
}
