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

output "infra_vpc_id" {
  value       = alicloud_vpc.infra_vpc.id
  description = "ID of the VPC created in the infra account"
}

output "infra_vswitch_id" {
  value       = alicloud_vswitch.infra_vswitch.id
  description = "ID of the VSwitch created in the infra account"
}
