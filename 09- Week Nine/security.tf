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
