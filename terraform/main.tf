# Provider configuration using RAM user credentials from master account
provider "alicloud" {
  region     = var.region
  account_id = 5855213964512610
}

# Call the VPC module
module "vpc" {
  source         = "./module/vpc"
  vpc_name       = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
}
