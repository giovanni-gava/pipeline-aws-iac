variable "subnets" {
  description = "Mapa de subnets com nome, CIDR e AZ"
  type = map(object({
    cidr_block = string
    az         = string
    map_public_ip_on_launch = bool
    type                    = string  # "public" ou "private"
  }))
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
