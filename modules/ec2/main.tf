resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address

  tags = merge(var.tags, {
    Name = var.name
  })

  root_block_device {
    volume_type           = var.root_block_device.volume_type
    volume_size           = var.root_block_device.volume_size
    delete_on_termination = var.root_block_device.delete_on_termination
  }
}

resource "aws_ebs_volume" "extra" {
  for_each = {
    for idx, volume in var.ebs_volumes :
    "${idx}" => volume
  }

  availability_zone = aws_instance.this.availability_zone
  size              = each.value.volume_size
  type              = each.value.volume_type
  encrypted         = each.value.encrypted

  tags = merge(var.tags, {
    Name = "${var.name}-ebs-${each.key}"
  })
}

resource "aws_volume_attachment" "extra" {
  for_each = aws_ebs_volume.extra

  device_name = each.value.device_name
  volume_id   = each.value.id
  instance_id = aws_instance.this.id
}
