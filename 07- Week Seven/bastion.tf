resource "aws_instance" "bastion" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = aws_key_pair.UbuntuKP.key_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name        = "bastion-host"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "UbuntuKP" {
  key_name   = "mykey" # Name of the key pair in AWS
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = <<EOF
    echo '${tls_private_key.pk.private_key_pem}' > ./mykey.pem
    chmod 400 mykey.pem
    EOF
  }
}
