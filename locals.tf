locals {
  common_tags = {
    Owner       = var.owner
    Project     = var.project
    Environment = var.environment
  }

  prefix_name = "${var.project}-${var.environment}"

  subnet_config = {
    public = {
      cidr_offsets = var.subnet_tier_public
      tier         = "public"
    }
    private = {
      cidr_offsets = var.subnet_tier_private
      tier         = "private"
    }
    restrict = {
      cidr_offsets = var.subnet_tier_restrict
      tier         = "restrict"
    }
  }

    CIDR = split(".", var.cidr)

}
