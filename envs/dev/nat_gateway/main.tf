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
    az1 = {
      public_subnet_id = module.subnet_public.subnet_ids["az1"]
    },
    az2 = {
      public_subnet_id = module.subnet_public.subnet_ids["az2"]
    }
  }
}
