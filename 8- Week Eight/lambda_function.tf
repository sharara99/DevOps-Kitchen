resource "aws_lambda_function" "s3_file_mover" {
  filename      = "lambda_function.zip"
  function_name = "s3_file_mover"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  environment {
    variables = {
      EXTERNAL_BUCKET = aws_s3_bucket.external.bucket
      INTERNAL_BUCKET = aws_s3_bucket.internal.bucket
    }
  }

  tags = {
    Name        = "s3_file_mover"
    Environment = var.Environment
    Owner       = var.Owner
  }
}
