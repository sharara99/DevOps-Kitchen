resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_policy" {
  bucket = aws_s3_bucket.bucket1.id

  rule {
    id     = "logs-rule"
    status = "Enabled"

    filter {
      prefix = "logs/"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    transition {
      days          = 180
      storage_class = "DEEP_ARCHIVE"
    }

    expiration {
      days = 360
    }
  }

  rule {
    id     = "outgoing-rule"
    status = "Enabled"

    filter {
      and {
        prefix = "outgoing/"
        tags = {
          "notDeepArchive" = "true"
        }
      }
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }

  rule {
    id     = "incoming-rule"
    status = "Enabled"

    filter {
      and {
        prefix                   = "incoming/"
        object_size_greater_than = 1048576    # 1 MB in bytes 
        object_size_less_than    = 1073741824 # 1 GB in bytes
      }
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}