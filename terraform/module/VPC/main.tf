# VPC resource in the dev account
resource "alicloud_vpc" "vpc" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr_block
  provider = alicloud.dev_account
  description = "VPC for dev account under Core > DEV folder in Hong Kong region"
  
  tags = {
    Environment = "dev"
    Folder      = "Core/DEV"
    ManagedBy   = "Terraform"
  }
}
