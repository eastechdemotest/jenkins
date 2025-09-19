# Provider configuration for Alibaba Cloud
terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.248.0"  # Use version supporting abandonable_check_id
    }
  }
}

# Management account provider (for Resource Directory and account creation)
provider "alicloud" {
  region = var.region
  # Credentials sourced from environment variables or Jenkins (ALICLOUD_ACCESS_KEY, ALICLOUD_SECRET_KEY)
}

# Infra account provider (placeholder for future resources, not used for Resource Directory)
provider "alicloud" {
  alias  = "infra"
  region = var.region
  assume_role {
    role_arn = "acs:ram::${module.landingzone_resource_structure.shared_services_account_id}:role/OrganizationRole"
    # Note: OrganizationRole must exist in infra account for future cross-account access
  }
}

# Landing Zone Resource Directory and account structure
module "landingzone_resource_structure" {
  source = "alibabacloud-automation/landing-zone-resource-structure/alicloud"

  enable_resource_directory = var.enable_resource_directory
  core_folder_name         = var.core_folder_name

  # Infra account (Shared Services for future networking, security)
  shared_services_account = {
    name                  = var.infra_account_name
    account_name_prefix   = var.infra_account_prefix
    abandonable_check_id  = var.abandonable_check_ids  # Updated to new field
    financial_mode        = var.financial_mode
  }

  # Log Archive account (for centralized logging with SLS)
  log_archive_account = {
    name                  = var.log_archive_account_name
    account_name_prefix   = var.log_archive_account_prefix
    abandonable_check_id  = var.abandonable_check_ids  # Updated to new field
    financial_mode        = var.financial_mode
  }
}

# Create Dev folder under Core folder
resource "alicloud_resource_manager_folder" "dev_folder" {
  folder_name      = var.dev_folder_name
  parent_folder_id = module.landingzone_resource_structure.core_folder_id
}

# Create Prod folder under Core folder
resource "alicloud_resource_manager_folder" "prod_folder" {
  folder_name      = var.prod_folder_name
  parent_folder_id = module.landingzone_resource_structure.core_folder_id
}