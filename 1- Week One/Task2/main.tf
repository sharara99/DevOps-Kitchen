
# Create S3 bucket with specified name, force_destroy set to true, and tags
resource "aws_s3_bucket" "bucket1" {
  bucket              = "s3-sharara-task2"
  force_destroy       = true
  object_lock_enabled = false

  tags = {
    Name        = "s3-sharara-task2"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "versioning_bucket1" {
  bucket = aws_s3_bucket.bucket1.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Create a "logs" directory in the S3 bucket
resource "aws_s3_object" "logs_dir" {
  bucket = aws_s3_bucket.bucket1.id
  key    = "logs/"
}

# Get the IAM user named "terraform"
data "aws_iam_user" "iam_user" {
  user_name = "terraform"
}

# Create policy document for the IAM user to allow upload only under logs/
data "aws_iam_policy_document" "upload_object_to_logs" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [data.aws_iam_user.iam_user.arn] 
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.bucket1.arn,
      "${aws_s3_bucket.bucket1.arn}/logs/*",
    ]
  }
}

# Create bucket policy by mentioning the policy document
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket1.id
  policy = data.aws_iam_policy_document.upload_object_to_logs.json
}