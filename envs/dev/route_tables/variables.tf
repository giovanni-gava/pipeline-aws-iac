variable "destination_cidr_block_public" {
  type        = string
  description = "Destino da rota pública (normalmente 0.0.0.0/0)"
  default     = "0.0.0.0/0"
}

variable "destination_cidr_block_private" {
  type        = string
  description = "Destino da rota privada (normalmente 0.0.0.0/0)"
  default     = "0.0.0.0/0"
}
