variable "name" {
  type        = string
  description = "Nome base para a VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block da VPC"
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  type        = bool
  description = "Habilita DNS support na VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Habilita DNS hostnames na VPC"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags comuns para todos os recursos"
  default     = {}
}
