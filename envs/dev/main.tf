provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source          = "../../modules/vpc"
  name            = "dev-vpc"
  cidr_block      = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Environment = "dev"
    Owner       = "Giovanni"
  }
}
