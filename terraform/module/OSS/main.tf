resource "alicloud_oss_bucket" "this" {
  bucket = "jenkinssdssduhs""
  acl    = var.acl
  tags   = var.tags
}