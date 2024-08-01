# Create an S3 bucket resource
resource "aws_s3_bucket" "bucket1" {
  bucket = "s3-sharara-task6"

  force_destroy       = true
  object_lock_enabled = false

  tags = {
    Name        = "s3-sharara-task6"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# Create a directory under the S3 bucket called  logs
resource "aws_s3_object" "logs_dir" {
  bucket = aws_s3_bucket.bucket1.id
  key    = "logs/"
}
