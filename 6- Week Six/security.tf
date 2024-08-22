# Define a security group named sg-01
resource "aws_security_group" "sg_01" {
  vpc_id = aws_vpc.vpc1.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sg-01"
    Environment = var.Environment
    Owner       = var.Owner
  }
}
