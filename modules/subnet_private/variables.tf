variable "vpc_id" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "az" {
  type    = string
  default = "us-east-1a"
}

variable "name" {
  type = string
}
