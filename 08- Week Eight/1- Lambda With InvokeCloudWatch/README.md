# Week Eight - Lambda: Manage File Transfer between S3 Buckets

## Overview
![My Image](https://github.com/sharara99/DevOps-Kitchen/blob/master/8-%20Week%20Eight/1-%20Lambda%20With%20InvokeCloudWatch/automated.gif)

FrogTech company faces the challenge of automating a manual process for transferring files between two S3 buckets. They use S3 as public storage for external and internal parties, with authentication via IAM credentials. The two main S3 buckets involved are:

1. **frogtech-sharara-external**
2. **frogtech-sharara-internal**

Currently, operators manually move files from one bucket to another, which is inefficient and prone to errors. You are tasked with automating this process using an AWS Lambda function, leveraging the Python `boto3` SDK.

FrogTech engineers are unfamiliar with AWS Lambda, so this document will cover the basics of Lambda functions and explain the following concepts:

- Function Event
- Function Context
- Function Environment Variables
- Lambda Layers
- Differences between Synchronous and Asynchronous Execution

Additionally, a diagram will be provided to explain the entire process of the created resources. All resources will be built using Infrastructure as Code (IaC) with Terraform, considering the requirements specified below.

## AWS Lambda Basics

### 1. Function Event
The event is the data structure that triggers the Lambda function. It contains information about the event source and details such as the bucket name and object key when working with S3.

### 2. Function Context
The context object provides information about the invocation, function environment, and execution. It includes properties like `aws_request_id`, `log_group_name`, `log_stream_name`, and `function_name`.

### 3. Function Environment Variables
Environment variables in Lambda are key-value pairs that store configuration settings. They can be used to pass settings like bucket names or other parameters to the function without hardcoding them.

### 4. Lambda Layers
Layers allow you to package libraries and other dependencies separately from your function code. This helps reduce the deployment package size and makes it easier to manage dependencies.

### 5. Synchronous vs Asynchronous Execution
- **Synchronous**: The function is invoked, and the caller waits for the result. Ideal for scenarios where the result is needed immediately.
- **Asynchronous**: The function is invoked, but the caller does not wait for the result. This is suitable for background processing tasks.
