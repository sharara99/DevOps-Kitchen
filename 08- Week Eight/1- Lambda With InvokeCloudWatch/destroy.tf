resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      bash ./rm-tf.sh
    EOT
  }

  depends_on = [
    aws_s3_bucket.internal,
    aws_s3_bucket.external,
    aws_iam_role_policy_attachment.lambda_s3_policy,
    aws_iam_role.lambda_execution_role,
    aws_lambda_function.s3_file_mover,
    aws_cloudwatch_event_rule.s3_event,
    aws_lambda_permission.cloudwatch_permission,
    aws_cloudwatch_event_target.lambda_target
  
  ]
}
