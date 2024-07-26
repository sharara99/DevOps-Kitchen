
# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}


# Create variables for environment and owner
variable "Environment" {}
variable "Owner" {}



# Create an S3 bucket resource
resource "aws_s3_bucket" "bucket1" {
  bucket = "s3-bucket-state-file"
  force_destroy = true
  object_lock_enabled = false

  tags = {
  Name        = "erakiterrafromstatefiles"
  Environment = var.Environment
  Owner       = var.Owner
  }
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "versioning_bucket1" {
  bucket = aws_s3_bucket.bucket1.id
  versioning_configuration {
    status = "Enabled"
  }
  
}

# Configure ownership controls for the S3 bucket
resource "aws_s3_bucket_ownership_controls" "control1" {
  bucket = aws_s3_bucket.bucket1.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}





