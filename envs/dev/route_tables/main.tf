data "terraform_remote_state" "subnet" {
  backend = "s3" # ou "local", "remote", etc.
  config = {
    bucket = "aws-tf-state-giovanni-development"
    key    = "dev/network/subnet/terraform.tfstate"
    region = "us-east-1"
  }
}
data "terraform_remote_state" "nat_gateway" {
  backend = "s3" # ou "local", "remote", etc.
  config = {
    bucket = "aws-tf-state-giovanni-development"
    key    = "dev/network/nat_gateway/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "internet_gateway" {
  backend = "s3" # ou "local", "remote", etc.
  config = {
    bucket = "aws-tf-state-giovanni-development"
    key    = "dev/network/internet_gateway/terraform.tfstate"
    region = "us-east-1"
  }
}


module "route_table" {
  source = "../../../modules/route_tables"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  tags   = local.common_tags

  route_tables = {
    "rt-public-1a" = {
      subnet_id = data.terraform_remote_state.subnet.outputs.public_subnet_ids_by_az["eu-west-1a"][0]
      routes = {
        destination_cidr_block = var.destination_cidr_block_public
        gateway_id             = data.terraform_remote_state.internet_gateway.outputs.internet_gateway_id
      }
    },
    "rt-private-1a" = {
      subnet_id = data.terraform_remote_state.subnet.outputs.private_subnet_ids_by_az["eu-west-1a"][0]
      routes = {
        destination_cidr_block = var.destination_cidr_block_private
        nat_gateway_id         = data.terraform_remote_state.nat_gateway.outputs.nat_gateway_ids_by_az["eu-west-1a"]
      }
    }
  }
}
