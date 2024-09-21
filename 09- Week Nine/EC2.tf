# Create an EC2 Instance
resource "aws_instance" "ubuntu-instance" {
  ami                   = var.ami
  instance_type         = "t2.micro"
  key_name              = 
  security_groups       = 
  iam_instance_profile  = 

  tags = {
    Name = "Ubuntu-EC2"
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
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
