output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.this.id
}

output "cidr_block" {
  description = "CIDR da VPC"
  value       = aws_vpc.this.cidr_block
}
