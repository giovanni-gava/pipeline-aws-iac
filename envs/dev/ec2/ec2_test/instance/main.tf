# data "terraform_remote_state" "subnet" {
#   backend = "s3"
#   config = {
#     bucket = "aws-tf-state-giovanni-development"
#     key    = "dev/network/subnet/terraform.tfstate"
#     region = "us-east-1"
#   }
# }


# module "ec2_app" {
#   source = "../../../modules/ec2"

#   name                         = var.name
#   ami_id                       = var.ami_id
#   instance_type                = var.instance_type
#   subnet_id                    = data.terraform_remote_state.subnet.outputs.private_subnet_ids_by_az[""][0]
#   security_group_ids           = var.security_group_ids
#   associate_public_ip_address  = var.associate_public_ip_address
#   tags                         = var.tags
#   root_block_device            = var.root_block_device
#   ebs_volumes                  = var.ebs_volumes
# }
