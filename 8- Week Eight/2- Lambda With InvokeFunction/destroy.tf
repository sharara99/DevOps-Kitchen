resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      bash ./rm-tf.sh
    EOT
  }

  depends_on = [
    aws_s3_bucket.external,
    aws_s3_bucket.internal,
    aws_iam_role.lambda_exec_role,
    aws_iam_policy.lambda_policy,
    aws_iam_role_policy_attachment.lambda_role_policy_attachment,
    aws_lambda_function.s3_transfer,
    aws_lambda_permission.allow_s3,
    aws_s3_bucket_notification.external_bucket_notification


  ]
}
