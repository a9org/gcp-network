locals {
  common_tags = {
    Owner       = var.owner
    Project     = var.project
    Environment = var.environment
  }

  prefix_name = "${var.project}-${var.environment}"

  CIDR = split(".", var.cidr)
}
