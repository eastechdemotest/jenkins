variable "bucket_name" {
  type        = string
  description = "A globally unique name for the OSS bucket."
}

variable "acl" {
  type        = string
  description = "The Access Control List for the bucket."
  default     = "private"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the bucket."
  default     = {}
}