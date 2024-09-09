# Create an S3 bucket resource
resource "aws_s3_bucket" "external" {
  bucket = "frogtech-us-external"

  force_destroy       = true
  object_lock_enabled = false
  acl                 = "private"
  tags = {
    Name        = "frogtech-us-external"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_s3_bucket" "internal" {
  bucket = "frogtech-us-internal"

  force_destroy       = true
  object_lock_enabled = false
  acl                 = "private"
  tags = {
    Name        = "frogtech-us-internal"
    Environment = var.Environment
    Owner       = var.Owner
  }
}


