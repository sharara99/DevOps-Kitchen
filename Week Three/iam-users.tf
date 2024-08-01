# Create IAM users
resource "aws_iam_user" "mostafa" {
  name = "Mostafa"
}

resource "aws_iam_user" "taha" {
  name = "Taha"
}

resource "aws_iam_role" "taha_role" {
  name = "TahaRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        "AWS" : "${aws_iam_user.taha.arn}"
      }
    }]
  })
}

resource "aws_iam_policy" "taha_s3_policy" {
  name = "TahaS3Policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = "s3:GetObject"
      Effect   = "Allow"
      Resource = "${aws_s3_bucket.bucket1.arn}/logs/*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "taha_policy_attach" {
  role       = aws_iam_role.taha_role.name
  policy_arn = aws_iam_policy.taha_s3_policy.arn
}

# Attach the Mostafa Policy to Taha User
resource "aws_iam_user_policy_attachment" "taha_policy_attachment" {
  user       = aws_iam_user.taha.name
  policy_arn = aws_iam_policy.taha_s3_policy.arn
}

# Create IAM Policy for Mostafa to PutObject
resource "aws_iam_policy" "mostafa_policy" {
  name        = "MostafaPolicy"
  description = "Policy for Mostafa to put objects in the S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:PutObject"
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.bucket1.arn}/*"
      }
    ]
  })
}

# Attach the Mostafa Policy to Mostafa User
resource "aws_iam_user_policy_attachment" "mostafa_policy_attachment" {
  user       = aws_iam_user.mostafa.name
  policy_arn = aws_iam_policy.mostafa_policy.arn
}
