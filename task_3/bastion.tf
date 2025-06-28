resource "aws_instance" "bastion" {
  ami                    = var.bastion_ami  # Ubuntu 22.04, us-east-1
  instance_type          = var.bastion_instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "k3s-bastion"
  }
}
