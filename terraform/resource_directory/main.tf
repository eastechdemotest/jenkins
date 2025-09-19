# Provider configuration
terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.229.0"
    }
  }
}

# Management account provider
provider "alicloud" {
  region = var.region
  # Credentials sourced from environment variables or Jenkins (ALICLOUD_ACCESS_KEY, ALICLOUD_SECRET_KEY)
}

# Infra account provider (using assume_role for cross-account access)
provider "alicloud" {
  alias  = "infra"
  region = var.region
  assume_role {
    role_arn = "acs:ram::${module.landingzone_resource_structure.shared_services_account_id}:role/OrganizationRole"
  }
}

# Landing Zone Resource Directory and accounts
module "landingzone_resource_structure" {
  source = "alibabacloud-automation/landing-zone-resource-structure/alicloud"

  enable_resource_directory = var.enable_resource_directory
  core_folder_name         = var.core_folder_name

  # Infra account (Shared Services)
  shared_services_account = {
    name                = var.infra_account_name
    account_name_prefix = var.infra_account_prefix
    abandon_able_check_id = var.abandon_able_check_ids
    financial_mode      = var.financial_mode
  }

  # Optional: Log Archive account (for centralized logging)
  log_archive_account = {
    name                = var.log_archive_account_name
    account_name_prefix = var.log_archive_account_prefix
    abandon_able_check_id = var.abandon_able_check_ids
    financial_mode      = var.financial_mode
  }

  # Resource folders for environments
  resource_folders = {
    dev = {
      name             = var.dev_folder_name
      parent_folder_id = module.landingzone_resource_structure.core_folder_id
    }
    prod = {
      name             = var.prod_folder_name
      parent_folder_id = module.landingzone_resource_structure.core_folder_id
    }
  }

  tags = {
    Environment = "LandingZone"
    ManagedBy   = "Terraform"
  }
}

# VPC in the infra account
resource "alicloud_vpc" "infra_vpc" {
  provider    = alicloud.infra
  vpc_name    = var.infra_vpc_name
  cidr_block  = var.infra_vpc_cidr
  description = "VPC for infra account in Alibaba Cloud Landing Zone"
}

# VSwitch in the infra VPC
resource "alicloud_vswitch" "infra_vswitch" {
  provider     = alicloud.infra
  vpc_id       = alicloud_vpc.infra_vpc.id
  cidr_block   = var.infra_vswitch_cidr
  zone_id      = var.infra_vswitch_zone
  vswitch_name = var.infra_vswitch_name
}
