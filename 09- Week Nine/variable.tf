variable "Environment" {
  description = "The environment for the resources"
  type        = string
}

variable "Owner" {
  description = "The owner of the S3 bucket"
  type        = string
}

# Define the Amazon Machine Image (AMI) ID
variable "ami" {
  type        = string
  description = "Default AMI ID for Ubuntu Server 24.04 LTS"
}

