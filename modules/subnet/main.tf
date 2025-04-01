resource "aws_subnet" "private_public" {
  for_each = var.subnets

  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = merge(
    var.tags,
    {
      Name = "${each.key}-${each.value.type}-${each.value.az}"
    }
  )
}
