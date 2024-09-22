resource "aws_security_group" "efs_sg" {
  vpc_id = aws_vpc.main_vpc.id
  name   = "efs-sg"

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr] # Allow access only from within the same VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "efs-sg"
    Environment = var.Environment
    Owner       = var.Owner
  }
}


resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name        = "bastion-sg"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_security_group" "lambda_sg" {
  name        = "lambda_security_group"
  description = "Allow Lambda to access EFS"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 2049 # NFS port
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr] # Allow access only from within the same VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}