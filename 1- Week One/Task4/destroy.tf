resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      bash ./rm-tf.sh
    EOT
  }

  depends_on = [aws_s3_bucket.bucket1, aws_iam_policy.mahmoud_s3_policy, aws_iam_role.mostafa_role, aws_iam_role_policy.mostafa_s3_policy, aws_iam_user.ahmed, aws_iam_user.mahmoud, aws_iam_user.mostafa, aws_iam_user_policy_attachment.ahmed_ec2_admin, aws_iam_user_policy_attachment.mahmoud_s3_policy_attach ]
}
