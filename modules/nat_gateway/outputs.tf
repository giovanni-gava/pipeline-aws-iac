output "nat_gateway_ids" {
  value = {
    for key, nat in aws_nat_gateway.this :
    key => nat.id
  }
}
