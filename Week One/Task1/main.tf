
# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# create AWS-vpc 
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

}

#create AWS-subnet
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"
}
