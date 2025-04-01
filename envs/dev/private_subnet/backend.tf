terraform {
  backend "s3" {
    bucket         = "aws-tf-state-giovanni-development"
    key            = "dev/network/private_subnet/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
