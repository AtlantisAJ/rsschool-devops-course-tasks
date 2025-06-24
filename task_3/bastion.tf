terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
resource "aws_instance" "bastion" {
  ami = "ami-02003f9f0fde924ea"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public_a.id
  key_name = "NAT-key-Jenya"
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "bastion-host"
  }
}
