resource "aws_eip" "this" {
  for_each = var.nat_gateways
  domain   = "vpc"
}

resource "aws_nat_gateway" "this" {
  for_each      = var.nat_gateways
  allocation_id = aws_eip.this[each.key].id
  subnet_id     = each.value.public_subnet_id

  tags = merge(
    var.tags,
    {
      Name = "${each.key}-nat-gateway"
    }
  )
}
