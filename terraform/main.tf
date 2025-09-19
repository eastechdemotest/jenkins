provider "alicloud" {
  # Access Key and Secret Key are read from environment variables by default
  region = "cn-hongkong"  # Change to your desired region, e.g., cn-beijing
}

# Management account provider (for Resource Directory and account creation)
provider "alicloud" {
  region = var.region
  # Credentials sourced from environment variables or Jenkins (ALICLOUD_ACCESS_KEY, ALICLOUD_SECRET_KEY)
}

# Call the resource_directory module
module "resource_directory" {
  source = "./module/resource_directory"

  enable_resource_directory = var.enable_resource_directory
  core_folder_name         = var.core_folder_name
  infra_account_name       = var.infra_account_name
  infra_account_prefix     = var.infra_account_prefix
  log_archive_account_name = var.log_archive_account_name
  log_archive_account_prefix = var.log_archive_account_prefix
  abandon_able_check_ids   = var.abandon_able_check_ids
  financial_mode           = var.financial_mode
  dev_folder_name          = var.dev_folder_name
  prod_folder_name         = var.prod_folder_name
}