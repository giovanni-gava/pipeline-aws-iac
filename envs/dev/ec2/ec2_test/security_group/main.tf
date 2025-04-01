data "terraform_remote_state" "vpc" {
  backend = "s3" # ou "local", "remote", etc.
  config = {
    bucket = "aws-tf-state-giovanni-development"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

module "security_group" {
  source      = "../../../../../modules/security_group"
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  tags        = local.common_tags

  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
}