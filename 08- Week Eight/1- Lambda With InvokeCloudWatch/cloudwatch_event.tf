resource "aws_cloudwatch_event_rule" "s3_event" {
  name                 = "s3_event_rule"
  description          = "Trigger Lambda every hour"
  schedule_expression  = "rate(1 hour)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.s3_event.name
  arn       = aws_lambda_function.s3_file_mover.arn

  # Lambda function permission to be triggered by CloudWatch Events
  depends_on = [
    aws_lambda_permission.cloudwatch_permission
  ]
}

resource "aws_lambda_permission" "cloudwatch_permission" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_file_mover.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.s3_event.arn
}
