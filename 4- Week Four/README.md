# Week Four Workshop

## Overview

In this workshop, you will use Infrastructure as Code (IaC) with Terraform to set up an S3 bucket, an EC2 instance, and an IAM role with permissions. You will then test the setup by sending a file to the S3 bucket from the EC2 instance using AWS CLI.

## Requirements

1. **Terraform State File**:
   - Use S3 to store the Terraform state file.
   - Bucket name: `erakiterrafromstatefiles`
   - Specify a unique key for the state file.

2. **S3 Bucket**:
   - Create a general-purpose S3 bucket.
   - Create a directory under the S3 bucket named `logs`.

3. **IAM Role**:
   - Create an IAM Role with the AWS-managed policy for full S3 access.
   - Attach this IAM Role to the EC2 instance.

4. **EC2 Instance**:
   - Launch an EC2 instance with the IAM Role attached.
   
5. **Testing**:
   - Verify the setup by using AWS CLI on the EC2 instance to send a file to the S3 bucket.
     - Use `aws s3 cp` or `aws s3api put-object` commands to upload a file from the EC2 instance to the S3 bucket.

6. **Repository Fork and Code Submission**:
   - Fork this repository.
   - Append your Terraform code to the code samples section below.
   - Request to accept the changes.

## Steps

1. **Set Up Terraform State File**:
   - Configure Terraform to use S3 for state file storage with a unique key.

2. **Create S3 Resources**:
   - Define a general-purpose S3 bucket.
   - Create a `logs` directory within the bucket.

3. **Create IAM Role**:
   - Define an IAM Role with full S3 access using AWS managed policies.
   - Attach this role to the EC2 instance.

4. **Launch EC2 Instance**:
   - Configure an EC2 instance with the IAM Role created in the previous step.

5. **Test Accessibility**:
   - SSH into the EC2 instance.
   - Use AWS CLI to upload a file to the S3 bucket:
     ```bash
     aws s3 cp <file_path> s3://<bucket_name>/logs/
     ```

6. **Update Repository**:
   - Fork the repository.
   - Append your Terraform code to the designated section.
   - Submit a pull request for review.

