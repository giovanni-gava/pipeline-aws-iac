vpc_id = "vpc-1234567890abcdef0"

subnets = {
  "app-subnet-1" = {
    cidr_block = "10.0.1.0/24"
    az         = "eu-west-1a"
  },
  "app-subnet-2" = {
    cidr_block = "10.0.2.0/24"
    az         = "eu-west-1b"
  }
}

tags = {
  Projeto = "Terraform-IAC"
  Amb     = "Dev"
}
