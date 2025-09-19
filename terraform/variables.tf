variable "region" {
  description = "Alibaba Cloud region for all resources"
  type        = string
  default     = "cn-hongkong"
}

variable "abandonable_check_ids" {
  description = "List of services to check before account deletion"
  type        = list(string)
  default     = ["SP_fc_fc"]
}

variable "jenkins_folder_name" {
  description = "Name of the Jenkins folder"
  type        = string
  default     = "Jenkins"
}

variable "jenkins_folder_id" {
  description = "ID of existing Jenkins folder (if any)"
  type        = string
  default     = ""
}

variable "dev_folder_name" {
  description = "Name of the Dev folder"
  type        = string
  default     = "Dev"
}

variable "dev_folder_id" {
  description = "ID of existing Dev folder (if any)"
  type        = string
  default     = ""
}

variable "prod_folder_name" {
  description = "Name of the Prod folder"
  type        = string
  default     = "Prod"
}

variable "prod_folder_id" {
  description = "ID of existing Prod folder (if any)"
  type        = string
  default     = ""
}

variable "dev_account_name" {
  description = "Name of the Dev account"
  type        = string
  default     = "DevAccount"
}

variable "dev_account_id" {
  description = "ID of existing Dev account (if any)"
  type        = string
  default     = ""
}

variable "prod_account_name" {
  description = "Name of the Prod account"
  type        = string
  default     = "ProdAccount"
}

variable "prod_account_id" {
  description = "ID of existing Prod account (if any)"
  type        = string
  default     = ""
}

variable "payer_account_id" {
  description = "ID of the payer account for billing"
  type        = string
  default     = "5183513340940185"  # Replace with your management account ID
}