resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "vpc1"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.subnet_public_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-subnet"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.subnet_private_1_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name        = "private-subnet-1"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.subnet_private_2_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name        = "private-subnet-2"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_internet_gateway" "gateway1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name        = "internet-gateway"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway1.id
  }

  tags = {
    Name        = "route-table1"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_route_table_association" "rt_association_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table1.id
}
