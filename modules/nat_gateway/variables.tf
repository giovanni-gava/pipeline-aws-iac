variable "nat_gateways" {
  type = map(object({
    public_subnet_id = string
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}

