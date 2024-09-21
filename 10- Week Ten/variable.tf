variable "Environment" {
  description = "The environment for the resources"
  type        = string
  default     = "terraformChamps"
}

variable "Owner" {
  description = "The owner of the resources"
  type        = string
  default     = "Mahmoud Sharara"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "efs_name" {
  description = "The name for the EFS file system"
  type        = string
}

variable "ami" {
  description = "AMI ID for the bastion host"
  type        = string
}
