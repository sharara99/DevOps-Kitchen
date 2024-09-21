# Define a security group named UbuntuSG
resource "aws_security_group" "UbuntuSG" {

  # Inbound rules
  ingress {
    from_port   = 22              # Allow inbound SSH access on port 22
    to_port     = 22
    protocol    = "tcp"           # Use TCP protocol
    cidr_blocks = ["0.0.0.0/0"]   # Allow access from any IP address
  }

  # Outbound rules
  egress {
    from_port   = 0               # Allow outbound traffic from any port
    to_port     = 0
    protocol    = "-1"            # Allow all protocols
    cidr_blocks = ["0.0.0.0/0"]   # Allow traffic to any IP address
  }

  tags = {
    Name        = "UbuntuSG"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "tls_private_key" "pk" {
  algorithm   = "RSA"
  rsa_bits    = 4096
}

resource "aws_key_pair" "UbuntuKP" {
  key_name   = "mykey"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = <<EOF
    echo '${tls_private_key.pk.private_key_pem}' > ./mykey.pem
    chmod 400 mykey.pem
    EOF
  }
}
