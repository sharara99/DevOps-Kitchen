
# Create AWS VPC
resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_01

  tags = {
    Name        = "vpc-01"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# Create AWS subnet-01
resource "aws_subnet" "subnet_01" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.subnet_01
  availability_zone = "us-east-1a"

  tags = {
    Name        = "subnet-01"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# Create AWS subnet-02
resource "aws_subnet" "subnet_02" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.subnet_02
  availability_zone = "us-east-1b"

  tags = {
    Name        = "subnet-02"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# Create an AWS internet gateway
resource "aws_internet_gateway" "gateway1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name        = "internet-gateway"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# Create an AWS route table
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

# Associate route table with subnets
resource "aws_route_table_association" "rt_association_subnet_01" {
  subnet_id      = aws_subnet.subnet_01.id
  route_table_id = aws_route_table.route_table1.id
}

resource "aws_route_table_association" "rt_association_subnet_02" {
  subnet_id      = aws_subnet.subnet_02.id
  route_table_id = aws_route_table.route_table1.id
}
