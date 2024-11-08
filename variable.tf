variable "zone" {
    description = "value"
    type = string
}

variable "owner" {
    description = "value"
    type = string
}

variable "project" {
    description = "value"
    type = string
}

variable "environment" {
    description = "value"
    type = string
}

variable "cidr" {
    description = "value"
    type = string
    default = "10.10.0.0/16"
}

variable "subnets" {
    description = "value"
    type = list(string)
    default = ["public", "private", "restrict"]
}

variable "subnet_tier_public" {
    description = "value"
    type = list(string)
    default = ["0.0", "1.0", "2.0"]
}

variable "subnet_tier_private" {
    description = "value"
    type = list(string)
    default = ["10.0", "11.0", "12.0"]
}

variable "subnet_tier_restrict" {
    description = "value"
    type = list(string)
    default = ["20.0", "21.0", "22.0"]
}

variable "nat_type" {
  description = "Type of NAT to create (e.g., 'natserver' or 'natgateway')"
  type        = string
}

variable "multi_az" {
  description = "Whether to create NAT in multiple AZs (true or false)"
  type        = bool
  default     = false
}

variable "nat_instance" {
    description = "value"
    type = string
    default = "f1.micro"
}
