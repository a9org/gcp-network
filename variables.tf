variable "region" {
  description = "The region where the resources will be created."
  type        = string
}

variable "owner" {
  description = "The owner of the infrastructure resources."
  type        = string
}

variable "project" {
  description = "The project name associated with the infrastructure resources."
  type        = string
}

variable "environment" {
  description = "The environment type (e.g., 'development', 'staging', 'production')."
  type        = string
}

variable "labels" {
  description = "List of additional labels to apply to resources."
  type        = list(string)
}

variable "cidr" {
  description = "CIDR range for the VPC (e.g., '10.16.0.0/16')"
  type        = string
}

variable "subnets" {
  description = "List of subnets to create (e.g., 'public', 'private', 'restrict')."
  type        = list(string)
  default     = ["public", "private", "restrict"]
  validation {
    condition     = contains(["public", "private", "restrict"], var.subnets)
    error_message = "The value must be 'public', 'private', or 'restrict'."
  }
}

variable "subnet_tier_public" {
  description = "CIDR offsets for public subnets."
  type        = list(string)
  default     = ["0.0", "1.0", "2.0"]
}

variable "subnet_tier_private" {
  description = "CIDR offsets for private subnets."
  type        = list(string)
  default     = ["10.0", "11.0", "12.0"]
}

variable "subnet_tier_restrict" {
  description = "CIDR offsets for restricted subnets."
  type        = list(string)
  default     = ["20.0", "21.0", "22.0"]
}

variable "nat_type" {
  description = "Type of NAT to create (e.g., 'natserver' or 'natgateway')"
  type        = string
  default     = "natserver"
  validation {
    condition     = contains(["natserver", "natgateway"], var.nat_type)
    error_message = "Invalid NAT type. Must be 'natserver' or 'natgateway'."
  }
}

variable "multi_az" {
  description = "Whether to create NAT in multiple AZs (true or false)"
  type        = bool
  default     = false
}

variable "nat_instance" {
  description = "The machine type for NAT server instances."
  type        = string
  default     = "f1.micro"
}
