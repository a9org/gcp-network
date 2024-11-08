# GCP Network Infrastructure with Terraform

This Terraform configuration is used to create a network infrastructure on Google Cloud Platform (GCP). It includes the creation of a VPC, multiple subnets (public, private, and restricted), and NAT services (either NAT server or NAT gateway). The configuration is flexible, allowing for customization through various variables.

## Features

- **VPC**: Creates a Virtual Private Cloud (VPC) to host all the subnets.
- **Subnets**: Configures public, private, and restricted subnets in multiple availability zones.
- **NAT Services**: Provides two options for NAT:
  - **NAT Server**: Uses a compute instance with `iptables` for packet forwarding.
  - **NAT Gateway**: Uses Google Cloud's NAT Gateway service.
- **Multi-AZ Support**: Optionally deploy NAT services across multiple availability zones.

## Prerequisites

- **Terraform**: Ensure you have Terraform installed. Version >= 1.0 is recommended.
- **GCP Credentials**: Set up your GCP credentials. You can use a service account key with appropriate permissions.

## Variables

### Required Variables

- **`cidr`**: CIDR range for the VPC (e.g., `10.16.0.0/16`).
- **`subnet_types`**: List of subnet types to create (e.g., `["public", "private"]`).
- **`nat_type`**: Type of NAT to create (`natserver` or `natgateway`).
- **`region`**: The region where the resources will be created.
- **`owner`**: The owner of the infrastructure resources.
- **`project`**: The project name associated with the infrastructure resources.
- **`environment`**: The environment type (`development`, `staging`, `production`).

### Optional Variables

- **`multi_az`**: Whether to create NAT in multiple AZs (default: `false`).
- **`labels`**: List of additional labels to apply to resources.
- **`subnets`**: List of subnets to create (`public`, `private`, `restrict`). Default is all three.
- **`subnet_tier_public`**: CIDR offsets for public subnets (default: `0.0`, `1.0`, `2.0`).
- **`subnet_tier_private`**: CIDR offsets for private subnets (default: `10.0`, `11.0`, `12.0`).
- **`subnet_tier_restrict`**: CIDR offsets for restricted subnets (default: `20.0`, `21.0`, `22.0`).
- **`nat_instance`**: The machine type for NAT server instances (default: `f1.micro`).

## Usage

1. **Clone the Repository**

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Customize Variables**

   Create a `terraform.tfvars` file to customize the required variables:

   ```hcl
   region     = "us-central1"
   owner      = "your_name"
   project    = "your_project"
   environment = "production"
   cidr       = "10.16.0.0/16"
   subnet_types = ["public", "private"]
   nat_type   = "natgateway"
   multi_az   = true
   ```

4. **Apply the Configuration**

   Run the following command to create the infrastructure:

   ```bash
   terraform apply
   ```

   Review the changes and confirm with `yes` to apply them.

## Outputs

- **VPC and Subnet Details**: Outputs relevant information about the VPC and subnets created.
- **NAT Information**: If NAT services are created, the output will include their details.

## Notes

- **NAT Server vs NAT Gateway**: Depending on the value provided for `nat_type`, the deployment will create either a NAT server (using a Compute Instance) or a NAT Gateway (using Google's managed service).
- **Multi-AZ Support**: If `multi_az` is set to `true`, NAT resources will be created in each availability zone and private subnets will route through the corresponding NAT.

## Cleanup

To destroy the infrastructure created by this Terraform configuration, run:

```bash
terraform destroy
```

Confirm with `yes` to proceed with the deletion of all resources.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Author

- **Rafael Botelho** - Initial work and Terraform configuration.

