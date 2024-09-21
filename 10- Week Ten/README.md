# AWS Lambda EFS Automation
This project automates the creation of directories on an EFS (Elastic File System) mounted disk using an AWS Lambda function. The function is triggered via a URL and developers pass directory names as parameters.

### Components
- **EFS**: Elastic File System for file storage.
- **Lambda Function**: Receives event values and creates directories based on them in the EFS.
- **VPC**: Lambda function operates inside a VPC with subnets to mount the EFS.
- **IAM Role**: Lambda function uses an IAM role with permissions to mount EFS and create directories.

### Setup Instructions

1. **Package Dependencies**:
    - Install dependencies: `pip install -r scripts/requirements.txt -t ./package`
    - Create a zip file for Lambda layer: `cd package && zip -r ../lambda_layer.zip . && cd ..`

2. **Apply Terraform Configuration**:
    - Initialize Terraform: `terraform init`
    - Apply the configuration: `terraform apply`

3. **Test**:
    - Invoke the Lambda function by calling its URL using the `curl` command and passing directory names as parameters.
