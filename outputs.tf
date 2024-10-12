output "aws_instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}

output "aws_instance_id" {
  value = aws_instance.ec2_instance.host_id
}
