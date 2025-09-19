output "resource_directory_id" {
  value       = module.resource_directory.resource_directory_id
  description = "ID of the Resource Directory"
}

output "jenkins_folder_id" {
  value       = module.resource_directory.jenkins_folder_id
  description = "ID of the Jenkins folder"
}

output "dev_folder_id" {
  value       = module.resource_directory.dev_folder_id
  description = "ID of the Dev folder"
}

output "prod_folder_id" {
  value       = module.resource_directory.prod_folder_id
  description = "ID of the Prod folder"
}

output "dev_account_id" {
  value       = module.resource_directory.dev_account_id
  description = "ID of the Dev account"
}

output "prod_account_id" {
  value       = module.resource_directory.prod_account_id
  description = "ID of the Prod account"
}