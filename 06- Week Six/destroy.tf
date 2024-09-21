resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      bash ./rm-tf.sh
      rm -f ./mykey.pem
    EOT
  }

  depends_on = [
    aws_s3_bucket.bucket1,
    aws_vpc.vpc1,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet_1,
    aws_subnet.private_subnet_2,
    aws_internet_gateway.gateway1,
    aws_route_table.route_table1,
    aws_route_table_association.rt_association_public_subnet,
    aws_security_group.sg_01,
    aws_security_group.bastion_sg,
    aws_db_subnet_group.rds_subnet_group,
    aws_instance.bastion,
    aws_db_instance.postgres,
    tls_private_key.pk,
    aws_key_pair.UbuntuKP
  ]
}
