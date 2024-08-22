variable "Environment" {
  description = "The environment for the resources"
  type        = string
}

variable "Owner" {
  description = "The owner of the resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_01_cidr" {
  description = "CIDR block for subnet-01"
  type        = string
}

variable "subnet_02_cidr" {
  description = "CIDR block for subnet-02"
  type        = string
}

variable "db_password" {
  description = "The password for the PostgreSQL RDS instance"
  type        = string
  sensitive   = true
}
