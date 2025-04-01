
variable "cidr_block" {
  type    = string
  default = "10.1.0.0/20"
}

variable "az" {
  type    = string
  default = "eu-west-1a"
}

variable "name" {
  type    = string
  default = "subnet1-private-a"
}