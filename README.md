# GCP Network Infrastructure Terraform Module

This repository provides a Terraform module to create and manage network infrastructure on Google Cloud Platform (GCP). It includes creating a VPC, public, private, and restricted subnets, and configuring NAT services, allowing flexible and secure network setups for various application environments.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Variables](#variables)
- [Outputs](#outputs)
- [Usage](#usage)
  - [Module Example](#module-example)
- [Cleanup](#cleanup)
- [License](#license)
- [Author](#author)

## Overview

This Terraform module sets up a robust network infrastructure on GCP, including a VPC with configurable subnets across multiple availability zones and NAT options. This allows scalable, segmented, and secure network setups across different environments (e.g., development, staging, production).

## Architecture

The network infrastructure includes the following components:

- **VPC**: A Virtual Private Cloud to host all the subnets.
- **Subnets**: Configurable public, private, and restricted subnets distributed across availability zones.
- **NAT**: Two options for NAT:
  - **NAT Server**: A compute instance configured with `iptables` for packet forwarding.
  - **NAT Gateway**: GCP's managed NAT Gateway service.
- **Multi-AZ**: NAT resources can be deployed across multiple availability zones.

## Prerequisites

- **Terraform**: Ensure that Terraform is installed (version >= 1.0 recommended).
- **GCP Credentials**: Set up GCP credentials with a service account that has the necessary permissions to manage network resources.
- **GCP APIs**: Enable the following APIs in your GCP project:
  - Compute Engine API
  - Cloud Resource Manager API

## Variables

This module supports the following variables for customization:

### Required Variables

- `cidr`: CIDR for the VPC (e.g., `10.16.0.0/16`).
- `subnet_types`: List of subnet types to create (e.g., `["public", "private"]`).
- `nat_type`: Type of NAT to use (`natserver` or `natgateway`).
- `region`: The region where resources are created.
- `owner`: The owner of the infrastructure resources.
- `project`: Project name associated with the infrastructure.
- `environment`: Type of environment (e.g., `development`, `staging`, `production`).

### Optional Variables

- `multi_az`: Whether to create NAT in multiple AZs (default: `false`).
- `labels`: Additional labels to apply to resources.
- `subnets`: List of subnets to create (`public`, `private`, `restrict`). Defaults to all three.
- `subnet_tier_public`: CIDR offsets for public subnets.
- `subnet_tier_private`: CIDR offsets for private subnets.
- `subnet_tier_restrict`: CIDR offsets for restricted subnets.
- `nat_instance`: Machine type for NAT server instances (default: `e2-micro`).

For more details, see `variables.tf`.

## Outputs

The module provides the following outputs:

- `vpc_id`: The ID of the created VPC.
- `vpc_self_link`: VPC Self Link
- `subnets_public`: IDs of the created public subnets.
- `subnets_private`: IDs of the created private subnets.
- `subnets_restrict`: IDs of the created restricted subnets.
- `subnets_public_self_link`: Public Subnets Self Link
- `subnets_private_self_link`: Private Subnets Self Link
- `subnets_restrict_self_link`: Restricted Subnets Self Link
- `nat_public_ips`: Public IPs for NAT, depending on `nat_type` (`natserver` or `natgateway`).

For additional details, refer to `outputs.tf`.

## Usage

### Module Example

To use this module in your Terraform configuration, reference it as follows:

```hcl
module "gcp_network" {
  source       = "git@github.com:a9org/gcp-network.git"
  cidr         = "10.16.0.0/16"
  region       = "us-central1"
  owner        = "your_name"
  project      = "your_project"
  environment  = "production"
  subnet_types = ["public", "private"]
  nat_type     = "natgateway"
  multi_az     = true
}
```

### Standalone Usage

1. **Clone the Repository**

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Configure Variables**

   Create a `terraform.tfvars` file and define the required variables:

   ```hcl
   region       = "us-central1"
   owner        = "your_name"
   project      = "your_project"
   environment  = "production"
   cidr         = "10.16.0.0/16"
   subnet_types = ["public", "private"]
   nat_type     = "natgateway"
   multi_az     = true
   ```

4. **Apply the Configuration**

   Run the following command to create the infrastructure:

   ```bash
   terraform apply
   ```

   Review the changes and confirm with `yes` to apply them.

## Cleanup

To destroy the infrastructure created by this Terraform configuration, run:

```bash
terraform destroy
```

Confirm with `yes` to proceed with deletion.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Author

- **Rafael Botelho** - Initial work and Terraform configuration.
