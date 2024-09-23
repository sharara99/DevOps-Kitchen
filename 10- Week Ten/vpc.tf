resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support = true  # Enable DNS support
  enable_dns_hostnames = true  # Enable DNS hostnames

  tags = {
    Name        = "main_vpc"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_subnet" "subnet_public_1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 8, 0)
  map_public_ip_on_launch = true

  tags = {
    Name        = "subnet-public-1"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_subnet" "subnet_public_2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 8, 1)
  map_public_ip_on_launch = true

  tags = {
    Name        = "subnet-public-2"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name        = "main_igw"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "public_route_table"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.subnet_public_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.subnet_public_2.id
  route_table_id = aws_route_table.public_route_table.id
}

