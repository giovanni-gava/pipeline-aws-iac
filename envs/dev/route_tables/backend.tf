terraform {
  required_version = ">= 1.5.0"
  backend "s3" {
    bucket         = "aws-tf-state-giovanni-development"
    key            = "dev/network/route_tables/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
