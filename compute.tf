# Create a Ec2 instance


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Owner is Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "my_web_server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.publicsubnet.id
    security_groups = [aws_security_group.web-allow.id]

    root_block_device {
      delete_on_termination = true
      volume_size = 10
      volume_type = "gp3"
    }

     tags = merge(local.common_tags,{
        Name = "my-web-server"
    })
  
  
}