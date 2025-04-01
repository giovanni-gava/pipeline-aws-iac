terraform {
  backend "s3" {
    bucket         = "aws-tf-state-giovanni-dev"
    key            = "dev/network/private_subnet/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
