
# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}


# create variables
variable "Environment" {}
variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "Owner" {}

# create AWS-vpc 
resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = "vpc1"
    Environment = var.Environment
    Owner       = var.Owner
  }

}

#create AWS-subnet from vpc1 
resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name        = "subnet1"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# create a AWS internet Getway 
resource "aws_internet_gateway" "gateway1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name        = "getway1"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# create a AWS Route Table 
resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc1.id

  # Route all traffic to the internet that's way we add (0.0.0.0/0)
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway1.id
  }

  tags = {
    Name        = "route_table1"
    Environment = var.Environment
    Owner       = var.Owner
  }

}

resource "aws_route_table_association" "rt_ass_1" {

  subnet_id      = aws_subnet.subnet1
  route_table_id = aws_route_table.route_table1

}

