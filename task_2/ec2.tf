resource "aws_instance" "public_instance" {
  ami = "ami-02003f9f0fde924ea"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public_1.id
  key_name = "049886442714"

  vpc_security_group_ids = [
  aws_security_group.public_sg.id
  ]

  tags = {
    Name = "Public-EC2-Instance"
  }
}
