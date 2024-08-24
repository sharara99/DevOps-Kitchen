output "vpc_id" {
  description = "The ID of the VPC (Virtual Private Cloud) created."
  value       = aws_vpc.vpc1.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet within the VPC, used for resources that need internet access."
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_1_id" {
  description = "The ID of the first private subnet within the VPC, used for resources that do not require direct internet access."
  value       = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  description = "The ID of the second private subnet within the VPC, used for additional private resources."
  value       = aws_subnet.private_subnet_2.id
}

output "db_instance_endpoint" {
  description = "The endpoint (DNS name) of the RDS instance for connecting to the database."
  value       = aws_db_instance.postgres.endpoint
}

output "bastion_instance_id" {
  description = "The ID of the bastion host instance used for secure access to other resources."
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "The public IP address of the bastion host, used for SSH access from external networks."
  value       = aws_instance.bastion.public_ip
}
