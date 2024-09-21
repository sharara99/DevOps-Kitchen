# AWS Lambda File Transfer Automation
![My Image](https://github.com/sharara99/DevOps-Kitchen/blob/master/8-%20Week%20Eight/2-%20Lambda%20With%20InvokeFunction/lambda-Invok-automated.gif)

This project automates the process of transferring files from an external S3 bucket to an internal S3 bucket using AWS Lambda. The Lambda function is triggered whenever a new file is uploaded to the external bucket.

### Components
- **S3 Buckets**: Two buckets (`frogtech-us-external`, `frogtech-us-internal`) are used for the file transfer process.
- **IAM Role**: Lambda function uses an IAM role with permissions to read from the external bucket and write to the internal bucket.
- **Lambda Function**: The function is triggered on S3 events, processes the event, and moves the file.

### File Structure
- **provider.tf**: AWS provider configuration.
- **variables.tf**: Defines the environment and owner variables.
- **terraform.tfvars**: Values for the environment and owner variables.
- **s3-buckets.tf**: S3 bucket resource definitions.
- **iam_role.tf**: IAM role and policy for the Lambda function.
- **lambda_function.tf**: Defines the Lambda function and its permissions.
- **lambda_function.py**: Python code for the Lambda function.

### Setup Instructions

1. **Prepare Lambda Code**: 
    - Navigate to the `lambda/` directory.
    - Run `zip -r lambda.zip lambda_function.py` to create a zip file for the Lambda function.

2. **Apply Terraform Configuration**:
    - Initialize Terraform: `terraform init`
    - Apply the configuration: `terraform apply`

3. **Test**:
    - Upload a file to the `frogtech-us-external` bucket and check if it is automatically transferred to the `frogtech-us-internal` bucket.
