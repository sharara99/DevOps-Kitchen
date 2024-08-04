resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      bash ./rm-tf.sh
    EOT
  }

  depends_on = [aws_s3_bucket.bucket1, aws_iam_policy.mostafa_policy, aws_iam_policy.taha_s3_policy , aws_iam_role.taha_role, aws_iam_role_policy_attachment.taha_policy_attach, aws_iam_user_policy_attachment.taha_policy_attachment,  aws_iam_user_policy_attachment.mostafa_policy_attachment ]
}
