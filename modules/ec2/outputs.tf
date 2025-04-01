output "instance_id" {
  value = aws_instance.this.id
}

output "private_ip" {
  value = aws_instance.this.private_ip
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "attached_volumes" {
  value = {
    for k, vol in aws_ebs_volume.extra : k => vol.id
  }
}
