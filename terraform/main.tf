provider "alicloud" {
  # Access Key and Secret Key are read from environment variables by default
  region = "cn-hongkong"  # Change to your desired region, e.g., cn-beijing
}

# Call the resource_directory module
module "resource_directory" {
  source = "./module/resource_directory"

  region                = var.region
  abandonable_check_ids = var.abandonable_check_ids
  jenkins_folder_name   = var.jenkins_folder_name
  jenkins_folder_id     = var.jenkins_folder_id
  dev_folder_name       = var.dev_folder_name
  dev_folder_id         = var.dev_folder_id
  prod_folder_name      = var.prod_folder_name
  prod_folder_id        = var.prod_folder_id
  dev_account_name      = var.dev_account_name
  dev_account_id        = var.dev_account_id
  prod_account_name     = var.prod_account_name
  prod_account_id       = var.prod_account_id
  payer_account_id      = var.payer_account_id
}