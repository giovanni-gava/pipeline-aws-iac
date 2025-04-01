
output "public_subnet_ids_by_az" {
  value = {
    for k, subnet in aws_subnet.this :
    subnet.availability_zone => subnet.id
    if var.subnets[k].type == "public"
  }
}

output "private_subnet_ids_by_az" {
  value = {
    for k, subnet in aws_subnet.this :
    subnet.availability_zone => subnet.id
    if var.subnets[k].type == "private"
  }
}
