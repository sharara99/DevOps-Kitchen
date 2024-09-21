Week Seven Workshop

At the end of the week, submit the following workshop.
Use IaC Terraform to build the following resource as specified:

* Create a diagram of this deployment.
* Use S3 to store Terraform statefile using "terraform.statefile" bucket.
* Consider using a unique name for the state file key.
* Create a VPC called vpc-01.
* Create Subnets called subnet-01 and subnet-02.
* Create a Security Group called sg-01:
    * Allows inbound port 5432 from all.
    * Allows outbound traffic for all.
* Create a DB subnet group for RDS holding the created subnets.
* Create a Highly-Available PostgreSQL RDS instance across multiple Availability Zones (Multi-AZ):
    * Primary and standby instances (no read replicas).
    * Allocate storage: 20 GB.
    * Engine: postgres.
    * Engine version: LATEST.
    * Instance class: db.t3.micro.
    * Name: postgresqldatabase.
    * Username: postgres.
    * Password: CHOOSE ONE.
    * Security group IDs: Created.
    * VPC security group IDs: Created.
    * Skip final snapshot: true.
    * Tags as specified below.
* Create a Bastion Host within the same VPC to connect to the RDS using `psql` commands.
* After deployment, check connection using `psql` commands from the Bastion Host.

**Requirement Specifications:**

* Resources must be created in the `us-east-1` region.
* Resources must have the following tags:
    * Key: "Environment" Value: "terraformChamps"
    * Key: "Owner" Value: "<type_your_name_here>"
* Prefer to use variables.
