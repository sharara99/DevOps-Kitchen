
# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}


# create variables
variable "Environment" {}
variable "Owner" {}


resource "aws_s3_bucket" "bucket1" {
  bucket = "bucket1"

  tags = {
  Name        = "bucket1"
  Environment = var.Environment
  Owner       = var.Owner
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket1.id
  acl    = "private"
  
}

resource "aws_s3_bucket_versioning" "versioning1" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
}

