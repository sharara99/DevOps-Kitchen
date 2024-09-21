resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      bash ./rm-tf.sh
      rm -f ./mykey.pem
    EOT
  }

  depends_on = [aws_s3_bucket.bucket1,
                aws_instance.ubuntu-instance,
                aws_key_pair.UbuntuKP, 
                aws_iam_role.ec2_role,
                aws_iam_role_policy_attachment.ec2_role_policy_attachment,
                aws_security_group.UbuntuSG,
                aws_iam_instance_profile.ec2_instance_profile
                ]
}