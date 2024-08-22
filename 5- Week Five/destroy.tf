resource "null_resource" "cleanup" {
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      bash ./rm-tf.sh
    EOT
  }

  depends_on = [aws_s3_bucket.bucket1,
                aws_subnet.subnet_01,
                aws_subnet.subnet_02,
                aws_security_group.sg_01,
                aws_route_table_association.rt_association_subnet_02,
                aws_route_table_association.rt_association_subnet_01,
                aws_route_table.route_table1,
                aws_internet_gateway.gateway1,
                aws_db_subnet_group.rds_subnet_group,
                aws_db_instance.postgres,

  ]
}
