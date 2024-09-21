resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com",
        },
      },
    ],
  })

  tags = {
    Name        = "lambda_execution_role"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_iam_role_policy_attachment" "lambda_s3_policy" {
  role      = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
