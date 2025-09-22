# Provider configuration using RAM user credentials from master account
provider "alicloud" {
  region     = var.region
  account_id = var.dev_account_id
}

# Call the VPC module
module "vpc" {
  source         = "./module/VPC"
  vpc_name       = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
}
