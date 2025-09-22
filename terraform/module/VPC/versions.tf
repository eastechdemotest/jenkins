# This file declares the providers that this specific module needs to function.
terraform {
  required_providers {
    # This line is the contract. It says "This module requires an alicloud provider".
    alicloud = {
      source  = "aliyun/alicloud"
      # It's good practice to lock to a specific version range
      version = "~> 1.206.0" 
    }
  }
}