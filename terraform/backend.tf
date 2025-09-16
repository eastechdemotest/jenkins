terraform {
  backend "oss" {
    bucket             = "terraform-state-bucket"
    prefix             = "landing-zone"
    key                = "terraform-state.tfstate"
    region             = "cn-hongkong"
    tablestore_endpoint = "https://jenkins.cn-hongkong.ots.aliyuncs.com"
    tablestore_table   = "statelock"
    access_key         = "LTAI5t63PHnEB7UjFQ1mrRpP"
    secret_key         = "qzBp5AORnY2eATOHAbK2Edx6rFtziG"
    endpoint           = "oss-cn-hongkong.aliyuncs.com"
  }
}
