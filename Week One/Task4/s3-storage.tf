# Create an S3 bucket resource
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

# Create an S3 bucket ownership control
resource "aws_s3_bucket_ownership_controls" "control1" {
  bucket = aws_s3_bucket.bucket1.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

# Enable the ACLs 
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket1.id
  depends_on = [ aws_s3_bucket_ownership_controls.control1 ]
  acl    = "private"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket1.id
  policy = data.aws_iam_user_policy_decuoment.policy_decuoment_backut1.json
}

data "aws_canonical_user_id" "current_user" {}


# create policy decuoment 
dadata "iam_user_policy_decuoment" "policy_decuoment_backut1" {
    Statement {
        sid = "111"
        Effect = "Allow"
        principal {
            type = "AWS"
            idontifier = ["${aws.iam.user.Mostafa.arn}"]
        }
        
        actions = [
            "s3.putOject"
        ]

        resources = [
            "${aws_s3_bucket.bucket1.arn}/mostafa"
        ]

    }
  
}  
