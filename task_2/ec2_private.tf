resource "aws_instance" "private_instance" {
  ami           = "ami-02003f9f0fde924ea"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private_1.id
  key_name      = "NAT-key-Jenya"

  vpc_security_group_ids = [
    aws_security_group.private_sg.id
  ]

  tags = {
    Name = "Private-EC2-Instance"
  }
}
