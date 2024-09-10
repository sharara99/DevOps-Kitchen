# Week Nine - Invoke SSM Document by Lambda

**Duration**: 1 week

## Project Overview
ForgTech has tasked you with deploying a clean and efficient infrastructure using **Terraform** to test your coding ability. The goal is to build a Lambda function that triggers an AWS Systems Manager (SSM) document to automate the mitigation response for restarting an SSH service. The Lambda function is invoked by CloudWatch events, and you will deploy an EC2 instance to test the functionality.

The challenge includes using high-level Terraform techniques, such as `if` conditions for resource tag inputs, local variables for common tags, and packaging Lambda function dependencies without using AWS native libraries. The project will focus on best practices and clean code principles.

## Requirements

- **Region**: Resources must be created in `us-east-1`.
- **Tagging**: All resources must include the following common tags:
  - **Key**: `Environment`, **Value**: `terraformChamps`
  - **Key**: `Owner`, **Value**: `<Your First Name>`

- **Functionality**:
  - A Lambda Python function that triggers an SSM Shell document.
  - The SSM document will restart the SSH service on the EC2 instance.
  - Deploy a temporary EC2 instance to test the trigger functionality.
  - Use **CloudWatch** to invoke the Lambda function.
  
- **High-level Terraform techniques**:
  - Use `if` conditions to allow users to input resource tag values or insert random values if none are provided.
  - Utilize local variables to combine common tags.
  - Package the Lambda function and its dependencies into a single ZIP file (do **not** use AWS native libraries).
  
## Architecture Diagram

Include an architecture diagram illustrating the deployment of the resources:
- **CloudWatch** triggering a **Lambda** function.
- **Lambda** invoking the **SSM Document**.
- **SSM Document** restarting the SSH service on the EC2 instance.

## Learning Outcomes

After completing this task, you should be able to:
1. Use Terraform to manage AWS Lambda, CloudWatch, SSM, and EC2 resources.
2. Implement tagging, local variables, and conditional logic in Terraform.
3. Package and deploy Lambda functions without relying on AWS native libraries.
4. Test automation triggers between Lambda and SSM for EC2 instance management.