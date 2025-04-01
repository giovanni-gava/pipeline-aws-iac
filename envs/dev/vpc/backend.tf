terraform {
  backend "s3" {
    bucket         = "aws-tf-state-giovanni-development"
    key            = "dev/network/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
