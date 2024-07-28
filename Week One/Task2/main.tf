
# Create an S3 bucket resource
resource "aws_s3_bucket" "bucket1" {
  bucket              = "s3-sharara-dev1"
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

# Create a directory under the S3 bucket called "logs"
resource "aws_s3_object" "logs_dir" {
  bucket = aws_s3_bucket.bucket1.id
  key    = "logs/"
}

# Provide bucket policy permission for your IAM user to upload objects only under logs
# terraform here is tha IAM user and have S3 full access
data "aws_iam_user" "logs_user" {
  user_name = "logs_user"  
}

# Provide bucket policy permission for your IAM user to upload objects only under logs
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket1.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowUserToUploadLogs"
        Effect    = "Allow"
        Principal = {
          AWS = data.aws_iam_user.logs_user.arn
        }
        Action    = "s3:PutObject"
        Resource  = "${aws_s3_bucket.bucket1.arn}/logs/*"
      }
    ]
  })
}