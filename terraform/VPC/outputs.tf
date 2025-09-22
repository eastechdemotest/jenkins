output "vpc_id" {
  description = "ID of the created VPC"
  value       = alicloud_vpc.vpc.id
}
