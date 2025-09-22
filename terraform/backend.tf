terraform {
  backend "oss" {
    bucket             = "jenkins0915"
    prefix             = "landing-zone-new"
    key                = "terraform-state-new.tfstate"
    region             = "cn-hongkong"
    tablestore_endpoint = "https://jenkins.cn-hongkong.ots.aliyuncs.com"
    tablestore_table   = "statelock"
    access_key         = "LTAI5t63PHnEB7UjFQ1mrRpP"
    secret_key         = "qzBp5AORnY2eATOHAbK2Edx6rFtziG"
    endpoint           = "oss-cn-hongkong.aliyuncs.com"
  }
}
