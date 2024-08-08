
# Create an S3 bucket resource
resource "aws_s3_bucket" "bucket1" {
  bucket = "s3-sharara-task3"

  force_destroy       = true
  object_lock_enabled = false

  tags = {
    Name        = "s3-sharara-task3"
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

# Create a directory under the S3 bucket called "(e.g. /log, /outgoing, /incomming)"
resource "aws_s3_object" "logs_dir" {
  bucket     = aws_s3_bucket.bucket1.id
  key        = "logs/"
  depends_on = [aws_s3_bucket.bucket1]
}

resource "aws_s3_object" "outgoing_dir" {
  bucket     = aws_s3_bucket.bucket1.id
  key        = "outgoing/"
  depends_on = [aws_s3_bucket.bucket1]
}

resource "aws_s3_object" "incomming_dir" {
  bucket     = aws_s3_bucket.bucket1.id
  key        = "incomming/"
  depends_on = [aws_s3_bucket.bucket1]
}

