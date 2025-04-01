variable "subnets" {
  description = "Mapa de subnets com nome, CIDR e AZ"
  type = map(object({
    cidr_block = string
    az         = string
  }))
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
