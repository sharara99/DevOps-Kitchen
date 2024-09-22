# Deploy Lambda function without a layer
resource "aws_lambda_function" "efs_directory_creator" {
  filename         = "lambda.zip"  # Zip file path containing your Lambda function code
  function_name    = "efs_directory_creator"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"

  environment {
    variables = {
      EFS_ID   = aws_efs_file_system.efs.id
      MOUNT_ID = aws_efs_mount_target.efs_mount["a"].id
    }
  }

  file_system_config {
    arn              = aws_efs_access_point.access_point.arn  # EFS access point ARN
    local_mount_path = "/mnt/efs"  # Local mount path inside the Lambda function
  }

  vpc_config {
    subnet_ids         = [aws_subnet.subnet_public_1.id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

  # Explicitly declare dependency on EFS mount target
  depends_on = [aws_efs_mount_target.efs_mount]

  lifecycle {
    create_before_destroy = true  # Ensures new resource is created before old one is destroyed during updates
  }
}

# Lambda function URL
resource "aws_lambda_function_url" "efs_directory_creator_url" {
  function_name      = aws_lambda_function.efs_directory_creator.function_name
  authorization_type = "NONE"
}