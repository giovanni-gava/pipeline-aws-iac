variable "vpc_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "route_tables" {
  description = "Mapeamento de route tables por nome lógico"
  type = map(object({
    subnet_id = string
    routes = optional(object({
      destination_cidr_block = string
      gateway_id             = optional(string)
      nat_gateway_id         = optional(string)
    }))
  }))
}
