resource "aws_instance" "k3s_server" {
  ami           = "ami-02003f9f0fde924ea"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private_1.id
  key_name      = "NAT-key-Jenya"
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "k3s-server"
  }
}

resource "aws_instance" "k3s_agent" {
  ami           = "ami-02003f9f0fde924ea"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private_2.id
  key_name      = "NAT-key-Jenya"
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "k3s-agent"
  }
}

user_data = <<-EOF
  #!/bin/bash
  curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-name k3s-server --tls-san $(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)" sh -
EOF
