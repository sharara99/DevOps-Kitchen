# Create an S3 bucket resource
resource "aws_s3_bucket" "bucket1" {
  bucket              = "s3-sharara-bct"
  force_destroy       = true
  object_lock_enabled = false

  tags = {
    Name        = "s3-sharara-bct"
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
    object_ownership = "BucketOwnerEnforced"  
    }
}

# Create a directory under the S3 bucket called "logs"
resource "aws_s3_object" "logs_dir" {
  bucket = aws_s3_bucket.bucket1.id
  key    = "logs/"
}

# Retrieve IAM user for policy attachment
data "aws_iam_user" "logs_user" {
  user_name = "terraform"
}

# Define a policy allowing delete object actions in S3
resource "aws_iam_policy" "logs_user_policy" {
  name        = "logs_user_policy"
  description = "Policy for S3 delete access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:DeleteObject"
        ],
        Resource = "arn:aws:s3:::s3-sharara-bct/*"
      }
    ]
  })
}

# Attach the policy to the IAM user
resource "aws_iam_user_policy_attachment" "logs_user_attachment" {
  user       = data.aws_iam_user.logs_user.user_name
  policy_arn = aws_iam_policy.logs_user_policy.arn
}
