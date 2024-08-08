# Week Five Workshop

## Overview

In this workshop, you will use Infrastructure as Code (IaC) with Terraform to build a PostgreSQL RDS instance and related resources. This includes creating a VPC, subnets, security groups, and configuring the RDS instance. You will also use S3 to store the Terraform state file.

## Requirements

1. **Terraform State File**:
   - Use S3 to store the Terraform state file.
   - Bucket name: `erakiterrafromstatefiles`
   - Specify a unique key for the state file.

2. **VPC and Subnets**:
   - Create a VPC named `vpc-01`.
   - Create two subnets named `subnet-01` and `subnet-02`.

3. **Security Group**:
   - Create a Security Group named `sg-01`.
     - Allow inbound traffic on port 5432 from all sources.
     - Allow outbound traffic to all destinations.

4. **Subnet Group**:
   - Create a subnet group for the RDS instance that includes the created subnets.

5. **RDS Instance**:
   - Create a PostgreSQL RDS instance with the following specifications:
     - **Allocated Storage**: 20 GB
     - **Engine**: PostgreSQL
     - **Engine Version**: Latest
     - **Instance Class**: db.t3.micro
     - **DB Name**: `postgresqldatabase`
     - **Username**: `postgres`
     - **Password**: CHOOSE ONE
     - **DB Security Group IDs**: Use the created security group
     - **VPC Security Group IDs**: Use the created security group
     - **Skip Final Snapshot**: true

6. **Tags**:
   - Ensure all resources have the following tags:
     - Key: `Environment`, Value: `terraformChamps`
     - Key: `Owner`, Value: `<type_your_name_here>`

7. **Region**:
   - Resources must be created in the `us-east-1` region.

8. **Testing**:
   - After deployment, verify the RDS instance's accessibility using the pgAdmin program from your local device. Ensure that the RDS instance is publicly accessible.

## Diagram

Create a diagram of the deployment architecture including:
- VPC
- Subnets
- Security Group
- RDS Instance
- S3 bucket for state file

## Notes

- Use variables in your Terraform configuration to avoid hardcoding values.
- Ensure the RDS instance is publicly accessible for testing with pgAdmin.

---

**Good luck with your deployment!** If you have any questions or run into issues, feel free to ask for help.
