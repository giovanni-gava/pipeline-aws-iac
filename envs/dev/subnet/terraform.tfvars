vpc_id = "vpc-1234567890abcdef0"

subnets = {
  "aws-subnet-1" = {
    cidr_block = "10.0.1.0/24"
    az         = "eu-west-1a"
    type       = "private"
    map_public_ip_on_launch = false
  },
  "aws-subnet-2" = {
    cidr_block = "10.0.2.0/24"
    az         = "eu-west-1b"
    type       = "private"
    map_public_ip_on_launch = false
  },
  "aws-subnet-3" = {
    cidr_block = "10.0.3.0/24"
    az         = "eu-west-1a"
    type       = "public"
    map_public_ip_on_launch = true
  }
}

tags = {
  Projeto = "Terraform-IAC"
  Amb     = "Dev"
}
