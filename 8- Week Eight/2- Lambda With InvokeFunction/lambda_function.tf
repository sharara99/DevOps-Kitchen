resource "aws_lambda_function" "s3_transfer" {
  filename      = "lambda_function.zip"
  function_name = "s3_transfer_function"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"

  environment {
    variables = {
      SOURCE_BUCKET = aws_s3_bucket.external.bucket
      DEST_BUCKET   = aws_s3_bucket.internal.bucket
    }
  }

}
resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_transfer.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.external.arn
}

resource "aws_s3_bucket_notification" "external_bucket_notification" {
  bucket = aws_s3_bucket.external.id

  lambda_function {
    events = ["s3:ObjectCreated:*"]
    lambda_function_arn = aws_lambda_function.s3_transfer.arn
  }

  depends_on = [aws_lambda_permission.allow_s3]
}

