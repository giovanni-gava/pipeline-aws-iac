data "terraform_remote_state" "subnet" {
  backend = "s3"
  config = {
    bucket = "aws-tf-state-giovanni-development"
    key    = "dev/network/subnet/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "security_group" {
  backend = "s3"
  config = {
    bucket = "aws-tf-state-giovanni-development"
    key    = "dev/ec2/ec2_test/security_group/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ec2_app" {
  source = "../../../modules/ec2"

  name                         = var.name
  key_name                     = var.key_name
  ami_id                       = var.ami_id
  instance_type                = var.instance_type
  subnet_id                    = data.terraform_remote_state.subnet.outputs.private_subnet_ids_by_az["eu-west-1a"][0]
  security_group_ids           = data.terraform_remote_state.security_group.outputs.security_group_ids
  associate_public_ip_address  = var.associate_public_ip_address
  tags                         = var.tags
  root_block_device            = var.root_block_device
  ebs_volumes                  = var.ebs_volumes
}
