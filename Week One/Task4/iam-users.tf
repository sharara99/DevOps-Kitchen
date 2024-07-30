# Create IAM user named Ahmed with EC2 Administrator policy
resource "aws_iam_user" "ahmed" {
  name = "Ahmed"
}

# Create IAM user named Mahmoud with S3 put and get objects policy restricted to a specific source IP
resource "aws_iam_user" "mahmoud" {
  name = "Mahmoud"
}

# Create IAM user named Mostafa with an IAM role to access S3 objects
resource "aws_iam_user" "mostafa" {
  name = "Mostafa"
}

# Create IAM Policy for Ahmed User
resource "aws_iam_user_policy_attachment" "ahmed_ec2_admin" {
  user       = aws_iam_user.ahmed.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}


resource "aws_iam_policy" "mahmoud_s3_policy" {
  name        = "mahmoud_s3_policy"
  description = "Policy to allow Mahmoud to put and get objects in S3 from specific IP"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject", "s3:GetObject"],
        Resource = [aws_s3_bucket.bucket1.arn]
        Condition = {
          IpAddress = {
            "aws:SourceIp" = "10.10.1.0/16"  
          }
        }
      }
    ]
  })
}

# Create IAM Policy for Mahmoud User
resource "aws_iam_user_policy_attachment" "mahmoud_s3_policy_attach" {
  user       = aws_iam_user.mahmoud.name
  policy_arn = aws_iam_policy.mahmoud_s3_policy.arn
}

# Create IAM Role for mostafa 
resource "aws_iam_role" "mostafa_role" {
  name = "mostafa_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          AWS = aws_iam_user.mostafa.arn
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

# Create IAM Role Policy for S3 Access for mostafa
resource "aws_iam_role_policy" "mostafa_s3_policy" {
  name   = "mostafa_s3_policy"
  role   = aws_iam_role.mostafa_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:GetObject"],
        Resource = "${aws_s3_bucket.bucket1.arn}/*" # Ensure to append /* to allow access to objects within the bucket
      }
    ]
  })
}

# Create Policy for Mostafa to Assume the Role
resource "aws_iam_policy" "mostafa_assume_role_policy" {
  name        = "mostafa_assume_role_policy"
  description = "Policy to allow Mostafa to assume the role"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "sts:AssumeRole",
        Resource = aws_iam_role.mostafa_role.arn
      }
    ]
  })
}


resource "aws_iam_user_policy_attachment" "mostafa_assume_role_policy_attachment" {
  user       = aws_iam_user.mostafa.name
  policy_arn = aws_iam_policy.mostafa_assume_role_policy.arn
}
