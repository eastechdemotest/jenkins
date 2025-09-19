output "resource_directory_id" {
  value       = module.resource_directory.resource_directory_id
  description = "ID of the Resource Directory"
}

output "core_folder_id" {
  value       = module.resource_directory.core_folder_id
  description = "ID of the Core folder"
}

output "infra_account_id" {
  value       = module.resource_directory.infra_account_id
  description = "ID of the infra (Shared Services) account"
}

output "log_archive_account_id" {
  value       = module.resource_directory.log_archive_account_id
  description = "ID of the Log Archive account"
}

output "dev_folder_id" {
  value       = module.resource_directory.dev_folder_id
  description = "ID of the Dev folder"
}

output "prod_folder_id" {
  value       = module.resource_directory.prod_folder_id
  description = "ID of the Prod folder"
}