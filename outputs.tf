output "aws_instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}
output "route_table_id" {
  value = aws_route_table.example.id
}