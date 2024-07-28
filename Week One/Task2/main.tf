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

resource "aws_s3_bucket_versioning" "versioning_bucket1" {
  bucket = aws_s3_bucket.bucket1.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "control1" {
  bucket = aws_s3_bucket.bucket1.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_object" "logs_dir" {
  bucket = aws_s3_bucket.bucket1.id
  key    = "logs/"
}

data "aws_iam_user" "logs_user" {
  user_name = "terraform"
}

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

resource "aws_iam_user_policy_attachment" "logs_user_attachment" {
  user       = data.aws_iam_user.logs_user.user_name
  policy_arn = aws_iam_policy.logs_user_policy.arn
}
