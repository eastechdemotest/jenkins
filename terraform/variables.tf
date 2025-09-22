variable "access_key" {
  description = "Alibaba Cloud Access Key for master account"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Alibaba Cloud Secret Key for master account"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Alibaba Cloud region"
  type        = string
  default     = "cn-hongkong"
}

variable "dev_account_id" {
  description = "Alibaba Cloud dev account ID under Core > DEV folder"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "dev-terraform-vpc"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
