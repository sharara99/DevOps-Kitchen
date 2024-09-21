# Outputs
output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "subnet_ids" {
  value = [aws_subnet.subnet_01.id, aws_subnet.subnet_02.id]
}

output "security_group_id" {
  value = aws_security_group.sg_01.id
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}
