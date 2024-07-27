
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
