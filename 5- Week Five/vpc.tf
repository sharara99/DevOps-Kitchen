# create AWS-vpc 
resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_01_cidr_block

  tags = {
    Name        = "vpc-01"
    Environment = var.Environment
    Owner       = var.Owner
  }
}


#create AWS-subnet-01 from vpc1 
resource "aws_subnet" "subnet_01" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.subnet_01_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name        = "subnet-01"
    Environment = var.Environment
    Owner       = var.Owner
  }
}


#create AWS-subnet-02 from vpc1 
resource "aws_subnet" "subnet_02" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.subnet_02_cidr_block
  availability_zone = "us-east-1b"

  tags = {
    Name        = "subnet-02"
    Environment = var.Environment
    Owner       = var.Owner
  }
}
