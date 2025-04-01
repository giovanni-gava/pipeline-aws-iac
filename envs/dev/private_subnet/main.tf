data "terraform_remote_state" "vpc" {
  backend = "s3" # ou "local", "remote", etc.
  config = {
    bucket = "aws-tf-state-giovanni-dev"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

module "aws_subnet" {
  source     = "../../../modules/subnet_private"
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block = var.cidr_block
  az         = var.az
  name       = var.name
  #  tags       = local.common_tags
}
