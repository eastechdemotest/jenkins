resource "alicloud_oss_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl
  tags   = var.tags
}