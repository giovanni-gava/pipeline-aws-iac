data "terraform_remote_state" "vpc" {
  backend = "s3" # ou "local", "remote", etc.
  config = {
    bucket = "aws-tf-state-giovanni-development"
    key    = "dev/network/subnet/terraform.tfstate"
    region = "us-east-1"
  }
}


module "nat_gateway" {
  source = "../../../modules/nat_gateway"
  tags   = local.common_tags

  nat_gateways = {
    "eu-west-1a" = {
      public_subnet_id = data.terraform_remote_state.subnet.outputs.public_subnet_ids_by_az["eu-west-1a"][0]
    },
    "eu-west-1b" = {
      public_subnet_id = data.terraform_remote_state.subnet.outputs.public_subnet_ids_by_az["eu-west-1b"][0]
    }
  }
}

