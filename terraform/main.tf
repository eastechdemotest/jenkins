provider "alicloud" {
  # Access Key and Secret Key are read from environment variables by default
  region = "cn-hongkong"  # Change to your desired region, e.g., cn-beijing
}

# Call the resource_directory module
module "resource_directory" {
  source = "./module/resource_directory"

  core_folder_name           = var.core_folder_name
  infra_account_name         = var.infra_account_name
  infra_account_prefix       = var.infra_account_prefix
  log_archive_account_name   = var.log_archive_account_name
  log_archive_account_prefix = var.log_archive_account_prefix
  abandonable_check_ids      = var.abandonable_check_ids  # Updated to new variable
  financial_mode             = var.financial_mode
  dev_folder_name            = var.dev_folder_name
  prod_folder_name           = var.prod_folder_name
}