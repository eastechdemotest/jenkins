# Provider configuration for Alibaba Cloud
terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.248.0"  # Latest version for compatibility
    }
  }
}

# Management account provider (for Resource Directory and account creation)
provider "alicloud" {
  region = var.region
  # Credentials sourced from environment variables or Jenkins (ALICLOUD_ACCESS_KEY, ALICLOUD_SECRET_KEY)
}

# Get the Resource Directory to obtain the root folder ID
data "alicloud_resource_manager_resource_directory" "root" {}

# Create Jenkins folder under Root folder (only if it doesn't exist)
resource "alicloud_resource_manager_folder" "jenkins_folder" {
  count            = var.jenkins_folder_id == "" ? 1 : 0
  folder_name      = var.jenkins_folder_name
  parent_folder_id = data.alicloud_resource_manager_resource_directory.root.root_folder_id
}

# Create Dev folder under Jenkins folder (only if it doesn't exist)
resource "alicloud_resource_manager_folder" "dev_folder" {
  count            = var.dev_folder_id == "" ? 1 : 0
  folder_name      = var.dev_folder_name
  parent_folder_id = var.jenkins_folder_id != "" ? var.jenkins_folder_id : alicloud_resource_manager_folder.jenkins_folder[0].id
}

# Create Dev account under Dev folder
resource "alicloud_resource_manager_account" "dev_account" {
  count                    = var.dev_account_id == "" ? 1 : 0
  display_name             = var.dev_account_name
  folder_id                = var.dev_folder_id != "" ? var.dev_folder_id : alicloud_resource_manager_folder.dev_folder[0].id
  payer_account_id         = var.payer_account_id
  abandonable_check_id     = var.abandonable_check_ids
}

# Create Prod folder under Jenkins folder (only if it doesn't exist)
resource "alicloud_resource_manager_folder" "prod_folder" {
  count            = var.prod_folder_id == "" ? 1 : 0
  folder_name      = var.prod_folder_name
  parent_folder_id = var.jenkins_folder_id != "" ? var.jenkins_folder_id : alicloud_resource_manager_folder.jenkins_folder[0].id
}

# Create Prod account under Prod folder
resource "alicloud_resource_manager_account" "prod_account" {
  count                    = var.prod_account_id == "" ? 1 : 0
  display_name             = var.prod_account_name
  folder_id                = var.prod_folder_id != "" ? var.prod_folder_id : alicloud_resource_manager_folder.prod_folder[0].id
  payer_account_id         = var.payer_account_id
  abandonable_check_id     = var.abandonable_check_ids
}