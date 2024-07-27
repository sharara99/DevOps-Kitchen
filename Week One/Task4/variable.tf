# Define the AWS region to be used
variable "region" {
  type    = string 
  default = "us-east-1"   # Default region is us-east-1
}

# Define the Amazon Machine Image (AMI) ID
variable "ami" {
  type    = string 
  default = "ami-04a81a99f5ec58529"     # Default AMI ID for Ubuntu Server 24.04 LTS
}

# Define the SSH public key to be used
variable "public_key" {
  description = "ssh public key"
}


variable "environment" {}

variable "owner" {}