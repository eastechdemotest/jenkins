
# ===== 2. DEFINE THE DEFAULT PROVIDER (for the Master Account) =====
# This authenticates using the credentials from Jenkins.
provider "alicloud" {
  region = "cn-hongkong"
}

# ===== 3. DEFINE THE ALIASED PROVIDER (for the Dev Account) =====
# This is the provider configuration that the error says is missing.
# It assumes the role in the target account.
provider "alicloud" {
  alias  = "dev_account"
  region = "cn-hongkong"

  assume_role {
    role_arn     = "acs:ram::5855213964512610:role/ResourceDirectoryAccountAccessRole"
    session_name = "Jenkins-Terraform-VPC-Creation"
  }
}

# ===== 4. CALL THE MODULE AND PASS THE PROVIDER =====
# This calls your VPC module and explicitly gives it the aliased provider.
module "vpc-dev" {
  source = "./module/VPC" # Make sure this path is correct

  providers = {
    alicloud = alicloud.dev_account
  }

  # Add any variables your module needs here
  # vpc_name   = "my-development-vpc"
  # cidr_block = "10.200.0.0/16"
}