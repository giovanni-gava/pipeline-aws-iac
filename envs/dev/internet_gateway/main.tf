data "terraform_remote_state" "vpc" {
  backend = "s3" # ou "local", "remote", etc.
  config = {
    bucket = "aws-tf-state-giovanni-development"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

module "internet_gateway" {
  source = "../../../modules/internet_gateway"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  name   = "igw-dev"
}


