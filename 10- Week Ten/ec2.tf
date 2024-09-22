resource "aws_instance" "bastion" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_public_1.id
  key_name               = aws_key_pair.UbuntuKP.key_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  # Enable public IP assignment
  associate_public_ip_address = true

  tags = {
    Name        = "bastion-host"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# Generate an RSA private key
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an EC2 Key Pair in AWS with the generated public key
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