
locals {
  my_list = split(",", var.aws_vpg_id)
  my_set  = toset(local.my_list)
}


resource "aws_route_table" "example" {
  vpc_id           = var.aws_vpc_id
  propagating_vgws = local.my_set
  tags = {
    Name = "AWS_ROUTE_TABLE"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = var.aws_subnet_id
  route_table_id = aws_route_table.example.id
}


resource "aws_security_group" "example_sg" {
  name   = "AWS_SECURITYGROUP"
  vpc_id = var.aws_vpc_id
  tags = {
    Name = "AWS_SECURITYGROUP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.example_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
  tags = {
    Name = "AWS_SECURITYGROUP_INGRESS"
  }
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.example_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "AWS_SECURITYGROUP_EGRESS"
  }
}


resource "aws_instance" "ec2_instance" {
  ami                    = "ami-0fff1b9a61dec8a5f"
  instance_type          = "t2.micro"
  subnet_id              = var.aws_subnet_id
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  tags = {
    Name = "AWS_EC2INSTANCE"
  }
}
