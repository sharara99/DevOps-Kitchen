# Create S3 bucket with specified name, force_destroy set to true, and tags
resource "aws_s3_bucket" "bucket1" {
  bucket              = "s3-sharara-task5"
  force_destroy       = true
  object_lock_enabled = false

  tags = {
    Name        = "s3-sharara-task5"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# Block all public access at the bucket level
# resource "aws_s3_bucket_public_access_block" "block_all" {
#   bucket = aws_s3_bucket.bucket1.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "versioning_bucket1" {
  bucket = aws_s3_bucket.bucket1.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Configure objects encryption as "SSE-S3" and enable bucket key
resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.bucket1.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }

    bucket_key_enabled = true
  }
}

# Configure lifecycle rule to expire objects after 7 days
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.bucket1.id

  rule {
    id     = "expire-objects"
    status = "Enabled"

    expiration {
      days = 7
    }

  }
}