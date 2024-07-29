# Create an S3 bucket for storing Terraform state file
resource "aws_s3_bucket" "bucket1" {
  bucket = "s3-sharara-task4"

  force_destroy       = true
  object_lock_enabled = false

  tags = {
    Name        = "s3-sharara-task4"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

