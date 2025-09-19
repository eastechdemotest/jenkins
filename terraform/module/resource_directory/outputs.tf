output "resource_directory_id" {
  value       = module.landingzone_resource_structure.resource_directory_id
  description = "ID of the Resource Directory"
}

output "core_folder_id" {
  value       = module.landingzone_resource_structure.core_folder_id
  description = "ID of the Core folder"
}

output "infra_account_id" {
  value       = module.landingzone_resource_structure.shared_services_account_id
  description = "ID of the infra (Shared Services) account"
}

output "log_archive_account_id" {
  value       = module.landingzone_resource_structure.log_archive_account_id
  description = "ID of the Log Archive account"
}

output "dev_folder_id" {
  value       = alicloud_resource_manager_folder.dev_folder.id
  description = "ID of the Dev folder"
}

output "prod_folder_id" {
  value       = alicloud_resource_manager_folder.prod_folder.id
  description = "ID of the Prod folder"
}