variable "region" {
  description = "Alibaba Cloud region for all resources"
  type        = string
  default     = "cn-hangzhou"
}

variable "enable_resource_directory" {
  description = "Enable Resource Directory"
  type        = bool
  default     = true
}

variable "core_folder_name" {
  description = "Name of the Core folder in Resource Directory"
  type        = string
  default     = "Core"
}

variable "infra_account_name" {
  description = "Name of the infra (Shared Services) account"
  type        = string
  default     = "InfraAccount"
}

variable "infra_account_prefix" {
  description = "Prefix for infra account name"
  type        = string
  default     = "infra-"
}

variable "log_archive_account_name" {
  description = "Name of the Log Archive account"
  type        = string
  default     = "LogArchiveAccount"
}

variable "log_archive_account_prefix" {
  description = "Prefix for Log Archive account name"
  type        = string
  default     = "log-archive-"
}

variable "abandon_able_check_ids" {
  description = "List of services to check before account deletion"
  type        = list(string)
  default     = ["SP_fc_fc"]
}

variable "financial_mode" {
  description = "Billing mode for accounts (Trusteeship or Self-pay)"
  type        = string
  default     = "Trusteeship"
}

variable "dev_folder_name" {
  description = "Name of the Dev folder"
  type        = string
  default     = "Dev"
}

variable "prod_folder_name" {
  description = "Name of the Prod folder"
  type        = string
  default     = "Prod"
}

variable "infra_vpc_name" {
  description = "Name of the VPC in the infra account"
  type        = string
  default     = "infra-vpc"
}

variable "infra_vpc_cidr" {
  description = "CIDR block for the infra VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "infra_vswitch_name" {
  description = "Name of the VSwitch in the infra VPC"
  type        = string
  default     = "infra-vswitch"
}

variable "infra_vswitch_cidr" {
  description = "CIDR block for the VSwitch in the infra VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "infra_vswitch_zone" {
  description = "Availability zone for the VSwitch"
  type        = string
  default     = "cn-hangzhou-b"
}
