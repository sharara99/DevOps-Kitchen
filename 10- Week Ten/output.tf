# Output Lambda function URL
output "lambda_function_url" {
  value       = aws_lambda_function_url.efs_directory_creator_url.function_url
  description = "The URL to invoke the Lambda function."
}

output "efs_filesystem_id" {
  value       = aws_efs_file_system.efs.id
  description = "The ID of the created EFS File System."
}

output "bastion_instance_id" {
  description = "The ID of the bastion host instance used for secure access to other resources."
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "The public IP address of the bastion host, used for SSH access from external networks."
  value       = aws_instance.bastion.public_ip
}