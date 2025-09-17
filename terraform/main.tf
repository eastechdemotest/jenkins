provider "alicloud" {
  access_key = "LTAI5t63PHnEB7UjFQ1mrRpP"
  secret_key = "qzBp5AORnY2eATOHAbK2Edx6rFtziG"
  region = "cn-hongkong"
}

resource "alicloud_ram_role" "ram_role" {
  name = "tf-pipeline-test"
  description = "test terraform pipeline"
  document    = <
}
