variable "Environment" {
  description = "The environment for the resources"
  type        = string
}

variable "Owner" {
  description = "The owner of the S3 bucket"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_public_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "subnet_private_1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
}

variable "subnet_private_2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
}

variable "ami" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}

