config {
  aws_region = "us-east-1"
  terraform_version = "1.5.0"
  deep_check = true
  ignore_module = false
}

plugin "aws" {
  enabled = true
  version = "0.18.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}