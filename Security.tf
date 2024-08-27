# Security group for HTTP access

resource "aws_security_group" "web-allow" {
    description = "Allow access to HTTP"
    name = "Web"
    vpc_id = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "HTTP" {
  security_group_id = aws_security_group.web-allow.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}


