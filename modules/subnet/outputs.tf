output "public_subnet_ids_by_az" {
  value = {
    for az in distinct([for k, v in var.subnets : v.az if v.type == "public"]) :
    az => [
      for k, subnet in aws_subnet.private_public :
      subnet.id
      if var.subnets[k].type == "public" && var.subnets[k].az == az
    ]
  }
}


output "private_subnet_ids_by_az" {
  value = {
    for az in distinct([for k, v in var.subnets : v.az if v.type == "private"]) :
    az => [
      for k, subnet in aws_subnet.private_public :
      subnet.id
      if var.subnets[k].type == "private" && var.subnets[k].az == az
    ]
  }
}

output "public_subnet_ids" {
  value = [
    for k, subnet in aws_subnet.private_public :
    subnet.id if var.subnets[k].type == "public"
  ]
}

output "private_subnet_ids" {
  value = [
    for k, subnet in aws_subnet.private_public :
    subnet.id if var.subnets[k].type == "private"
  ]
}