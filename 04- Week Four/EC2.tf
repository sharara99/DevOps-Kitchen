# Create an EC2 Instance
resource "aws_instance" "ubuntu-instance" {
  ami                   = var.ami
  instance_type         = "t2.micro"
  key_name              = aws_key_pair.UbuntuKP.key_name
  security_groups       = [aws_security_group.UbuntuSG.name]
  iam_instance_profile  = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = "Ubuntu-EC2"
  }
}

