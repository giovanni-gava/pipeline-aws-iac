name                        = "app-server"
ami_id                      = "ami-0df368112825f8d8f"
key_name                    = "aws-dev-test-linux"
instance_type               = "t3.micro"
subnet_id                   = "subnet-123abc" # ou use data.terraform_remote_state se preferir
security_group_ids          = ["sg-12345678"]
associate_public_ip_address = false

tags = {
  Projeto = "EC2 App"
  Amb     = "Dev"
  Name    = "aws-dev-linux-teste"
}

root_block_device = {
  volume_type           = "gp3"
  volume_size           = 30
  delete_on_termination = true
}

# ebs_volumes = [
#   {
#     device_name = "/dev/sdf"
#     volume_type = "gp3"
#     volume_size = 100
#     encrypted   = true
#   },
#   {
#     device_name = "/dev/sdg"
#     volume_type = "io2"
#     volume_size = 50
#     encrypted   = true
#   }
# ]
