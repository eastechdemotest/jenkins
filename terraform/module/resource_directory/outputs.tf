output "resource_directory_id" {
  value       = data.alicloud_resource_manager_resource_directory.root.id
  description = "ID of the Resource Directory"
}

output "jenkins_folder_id" {
  value       = var.jenkins_folder_id != "" ? var.jenkins_folder_id : (length(alicloud_resource_manager_folder.jenkins_folder) > 0 ? alicloud_resource_manager_folder.jenkins_folder[0].id : "")
  description = "ID of the Jenkins folder"
}

output "dev_folder_id" {
  value       = var.dev_folder_id != "" ? var.dev_folder_id : (length(alicloud_resource_manager_folder.dev_folder) > 0 ? alicloud_resource_manager_folder.dev_folder[0].id : "")
  description = "ID of the Dev folder"
}

output "prod_folder_id" {
  value       = var.prod_folder_id != "" ? var.prod_folder_id : (length(alicloud_resource_manager_folder.prod_folder) > 0 ? alicloud_resource_manager_folder.prod_folder[0].id : "")
  description = "ID of the Prod folder"
}

output "dev_account_id" {
  value       = var.dev_account_id != "" ? var.dev_account_id : (length(alicloud_resource_manager_account.dev_account) > 0 ? alicloud_resource_manager_account.dev_account[0].id : "")
  description = "ID of the Dev account"
}

output "prod_account_id" {
  value       = var.prod_account_id != "" ? var.prod_account_id : (length(alicloud_resource_manager_account.prod_account) > 0 ? alicloud_resource_manager_account.prod_account[0].id : "")
  description = "ID of the Prod account"
}