resource "aws_subnet" "private" {
  for_each = var.subnets

  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = merge(
    var.tags,
    {
      Name = "${each.key}-private-${each.value.az}"
    }
  )
}
