# Provider configuration
terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.0.0"
    }
  }
}

provider "alicloud" {
  # Access Key and Secret Key are read from environment variables by default
  region = "cn-hongkong"  # Change to your desired region, e.g., cn-beijing
}

# Create a VPC
resource "alicloud_vpc" "example" {
  vpc_name   = "example-vpc"
  cidr_block = "10.0.0.0/16"  # Adjust CIDR block as needed (must be valid IPv4)

  # Optional: Add description
  description = "This is a test VPC created by Terraform"

  # Optional: Enable IPv6 (set to true if needed)
  enable_ipv6 = false
}

# Output the VPC ID for reference
output "vpc_id" {
  value = alicloud_vpc.example.id
}
