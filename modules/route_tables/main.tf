resource "aws_route_table" "this" {
  for_each = var.route_tables

  vpc_id = var.vpc_id

  tags = merge(var.tags, {
    Name = "${each.key}-rt"
  })
}

resource "aws_route_table_association" "this" {
  for_each = var.route_tables

  subnet_id      = each.value.subnet_id
  route_table_id = aws_route_table.this[each.key].id
}

resource "aws_route" "this" {
  for_each = {
    for key, rt in var.route_tables :
    key => rt if rt.routes != null
  }

  route_table_id         = aws_route_table.this[each.key].id
  destination_cidr_block = each.value.routes.destination_cidr_block
  gateway_id             = lookup(each.value.routes, "gateway_id", null)
  nat_gateway_id         = lookup(each.value.routes, "nat_gateway_id", null)
}
