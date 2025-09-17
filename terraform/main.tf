// The provider block no longer contains secrets.
// It will get them from the environment variables set by Jenkins.
provider "alicloud" {
  region = "cn-hongkong"
}

resource "alicloud_ram_role" "ram_role" {
  name        = "tf-pipeline-test"
  description = "test terraform pipeline"
  // This is a valid policy document that allows ECS services to assume this role.
  document    = <<EOF
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ecs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOF
}
