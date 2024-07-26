
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
  bucket              = "s3-bucket-state-file"
  force_destroy       = true
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

# Disable ACL for the S3 bucket
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket1.id
  acl    = "private"
}

# Create a directory under the S3 bucket called "logs"
resource "aws_s3_bucket_object" "logs_dir" {
  bucket = aws_s3_bucket.bucket1.id
  key    = "logs/"
}


# Provide bucket policy permission for your IAM user to upload objects only under logs
# terraform here is tha IAM user and have S3 full access
data "aws_iam_user" "terraform_user" {
  user_name = "terraform"  
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket1.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowUserToUploadLogs"
        Effect    = "Allow"
        Principal = {
          AWS = data.aws_iam_user.terraform_user.arn
        }
        Action    = "s3:PutObject"
        Resource  = "${aws_s3_bucket.bucket1.arn}/logs/*"
      }
    ]
  })
}