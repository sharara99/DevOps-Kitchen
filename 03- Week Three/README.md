# Week Three Workshop

## Overview
In this workshop, you will use Terraform to create and configure AWS resources. Follow the instructions below to complete the workshop.

## Requirements

### 1. S3 Bucket for Terraform State Files
- **Name:** `erakiterrafromstatefiles`
- **Purpose:** Store Terraform state files.
- **Note:** Specify a unique name for the state file key.

### 2. General-Purpose S3 Bucket
- **Create a new S3 bucket** for general use.

### 3. Directory in S3 Bucket
- **Directory Name:** `logs`
- **Location:** Under the general-purpose S3 bucket.

### 4. IAM Users
- **Create two IAM Users:**
  - `Mostafa`
  - `Taha`

### 5. IAM Role for Taha
- **Role Name:** `TahaRole`
- **Policy:** Allow `s3:GetObject` access to the `logs` directory only.

### 6. S3 Bucket Policy
- **Allow `Mostafa`** to put objects (i.e., `s3:PutObject`) in the entire S3 bucket.

### 7. Testing Access
- **AWS CLI Commands:**
  - Test using `aws s3` commands.
  - Test using `aws s3api` commands.
- **Credentials:** Use IAM user credentials for `Mostafa` and `TahaRole` credentials.

## Steps to Complete

1. **Set Up Terraform Configuration**
   - Define the S3 buckets and directory.
   - Create IAM users and roles.
   - Configure the S3 bucket policy.

2. **Test the Configuration**
   - Verify access using AWS CLI commands.

3. **Submit Your Work**
   - **Fork the repository** containing your Terraform code.
   - **Append your code** to the code samples section.
   - **Request to accept** your changes.

## Additional Information
- Ensure all resources are created according to the specifications.
- Verify permissions and access before submission.
