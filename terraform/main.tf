provider "alicloud" {
  # Access Key and Secret Key are read from environment variables by default
  region = "cn-hongkong"  # Change to your desired region, e.g., cn-beijing
}

# Provider configuration using RAM user credentials from master account
provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
  account_id = var.dev_account_id
}

# Call the VPC module
module "vpc" {
  source         = "./modules/vpc"
  vpc_name       = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
}
