# Create an S3 bucket resource
resource "aws_s3_bucket" "bucket1" {
  bucket = "s3-sharara-week-10"

  force_destroy       = true
  object_lock_enabled = false

  tags = {
    Name        = "s3-sharara-week-10"
    Environment = var.Environment
    Owner       = var.Owner
  }
}