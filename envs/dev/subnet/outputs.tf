output "public_subnet_ids_by_az" {
  value = module.aws_subnet.public_subnet_ids_by_az
}

output "private_subnet_ids_by_az" {
  value = module.aws_subnet.private_subnet_ids_by_az
}

output "public_subnet_ids" {
  value = module.aws_subnet.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.aws_subnet.private_subnet_ids
}
