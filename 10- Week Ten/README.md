# Lambda - URL Invoking

## Week Ten - Invoke Function via Function URL

**Duration:** 1 week

### Project Overview

FrogTech company wants to test your ability to write clean code by deploying the structure of resources. This project aims to help you build a good reputation while automating processes and configurations on an EFS-mounted disk using internal scripts created by developers.

### Objective

You are requested to create a Lambda function that mounts the EFS disk to submit and configure passed parameters to the function event. Developers will provide directory names as event values, and your mission is to create directories based on these values.

### Workflow

1. Developers will pass values to the function event.
2. The function will create directories into the mounted EFS based on the passed event values.
3. Test the function and provide FrogTech developers with the function URL so they can include it in their scripts using the `curl` command.

### Requirements

FrogTech requires the use of high-level HCL language techniques, including:

- Crafting a subnet resources module.
- Packaging library dependencies as a ZIP file and using it in the Lambda layer.
- Using Infrastructure as Code (IaC) with Terraform to build all resources.

### Specifications

1. Resources must be created in the `us-east-1` region.
2. Resources must have common tags as follows:
   - Key: **Environment**, Value: **terraformChamps**
   - Key: **Owner**, Value: **Your_First_Name**

