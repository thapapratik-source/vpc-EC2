output "ec2" {
    value = aws_instance.my_web_server.associate_public_ip_address
  
}

output "ec2_dns" {
    value = aws_instance.my_web_server.public_dns
  
}