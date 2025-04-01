variable "name" {
  description = "Nome da instância"
  type        = string
}

variable "ami_id" {
  description = "AMI ID da instância"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
}

variable "subnet_id" {
  description = "Subnet onde a instância será criada"
  type        = string
}

variable "security_group_ids" {
  description = "Lista de SGs associados à instância"
  type        = list(string)
  default     = []
}

variable "associate_public_ip_address" {
  description = "Associar IP público?"
  type        = bool
  default     = false
}

variable "root_block_device" {
  description = "Configuração do disco raiz"
  type = object({
    volume_type           = string
    volume_size           = number
    delete_on_termination = bool
  })
  default = {
    volume_type           = "gp3"
    volume_size           = 20
    delete_on_termination = true
  }
}

variable "ebs_volumes" {
  description = "Volumes EBS adicionais"
  type = list(object({
    device_name = string
    volume_type = string
    volume_size = number
    encrypted   = bool
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
