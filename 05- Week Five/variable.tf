variable "Environment" {
  description = "The environment for the resources"
  type        = string
}

variable "Owner" {
  description = "The owner of the resources"
  type        = string
}

variable "vpc_01" {
  description = "CIDR block for vpc-01"
  type        = string
}

variable "subnet_01" {
  description = "CIDR block for subnet-01"
  type        = string
}

variable "subnet_02" {
  description = "CIDR block for subnet-02"
  type        = string
}

variable "db_password" {
  description = "The password for the PostgreSQL RDS instance"
  type        = string
  sensitive   = true
}

