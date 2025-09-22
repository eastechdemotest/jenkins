# Provider configuration using RAM user credentials from master account
provider "alicloud" {
  region     = var.region
  alias  = "dev_account"

  assume_role {
    // This is the ARN of the special, pre-created role in your Dev account.
    // This is the role the console uses automatically.
    role_arn     = "acs:ram::5855213964512610:role/ResourceDirectoryAccountAccessRole"
    
    session_name = "Jenkins-Terraform-VPC-Creation" // A name for logging
  }
}

# Call the VPC module
module "vpc" {
    providers = {
    alicloud = alicloud.dev_account
  }
  
  source         = "./module/VPC"
  vpc_name       = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
}
