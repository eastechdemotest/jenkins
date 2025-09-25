output "application_bucket_name" {
  description = "The name of the newly created OSS application bucket."
  value       = module.oss_bucket.bucket_name
}

output "application_bucket_endpoint" {
  description = "The public endpoint of the OSS application bucket."
  value       = module.oss_bucket.bucket_endpoint
}