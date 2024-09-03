# Create S3 buckets
resource "aws_s3_bucket" "external" {
  bucket = "frogtech-sharara-external"
  acl    = "private"

  tags = {
    Name        = "frogtech-sharara-external"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_s3_bucket" "internal" {
  bucket = "frogtech-sharara-internal"
  acl    = "private"

  tags = {
    Name        = "frogtech-sharara-internal"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

