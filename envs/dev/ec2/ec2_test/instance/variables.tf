variable "name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "associate_public_ip_address" {
  type    = bool
  default = false
}

variable "root_block_device" {
  type = object({
    volume_type           = string
    volume_size           = number
    delete_on_termination = bool
  })
}

variable "ebs_volumes" {
  type = list(object({
    device_name = string
    volume_type = string
    volume_size = number
    encrypted   = bool
  }))
  default = []
}

variable "tags" {
  type = map(string)
}
