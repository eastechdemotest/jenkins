output "bucket_name" {
  description = "The name of the OSS bucket."
  value       = alicloud_oss_bucket.this.bucket
}

output "bucket_endpoint" {
  description = "The public endpoint of the OSS bucket."
  value       = alicloud_oss_bucket.this.extranet_endpoint
}