variable "Environment" {
  description = "The environment for the resources"
  type        = string
}

variable "Owner" {
  description = "The owner of the resources"
  type        = string
}

variable "vpc_01_cidr_block" {
  description = "CIDR block for vpc-01"
  type        = string
}

variable "subnet_01_cidr_block" {
  description = "CIDR block for subnet-01"
  type        = string
}

variable "subnet_02_cidr_block" {
  description = "CIDR block for subnet-02"
  type        = string
}
