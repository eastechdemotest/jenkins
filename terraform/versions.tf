# This file declares the providers that the ROOT module needs.
terraform {
  required_providers {
    # This line tells the root module to use the official Aliyun provider.
    # This will now match what the child module expects.
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.206.0" // Match the version from your child module
    }
  }
}