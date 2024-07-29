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

# Create IAM Policy for each one of users
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
        Resource = "arn:aws:s3:::s3-sharara-task4/*",
        Condition = {
          IpAddress = {
            "aws:SourceIp" = "your-specific-ip-address"  # Replace with the specific source IP
          }
        }
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "mahmoud_s3_policy_attach" {
  user       = aws_iam_user.mahmoud.name
  policy_arn = aws_iam_policy.mahmoud_s3_policy.arn
}

resource "aws_iam_role" "mostafa_role" {
  name = "mostafa_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          AWS = "arn:aws:iam::your-account-id:user/Mostafa"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "mostafa_s3_policy" {
  name   = "mostafa_s3_policy"
  role   = aws_iam_role.mostafa_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:GetObject"],
        Resource = "arn:aws:s3:::s3-sharara-task4/*"
      }
    ]
  })
}
