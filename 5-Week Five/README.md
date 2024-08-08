Week Five Workshop
At the end of the week, submit the following workshop.
use IaC Terraform to build the following resource besides requirement specifications:
In the following task will walk through the RDS creation, Then test accessibility by pgadmin program.

Create a diagram of this deployment.

Use S3 to store Terraform statefile using "erakiterrafromstatefiles" bucket

Consider to use different name that others (i.e. specify a unique name for state file key)
Create a VPC called vpc-01

Create Subnets called subnet-01, subnet-02.

Create a Security Group called sg-01

Allows inbound 5432 port form all.
Allows outbound role for all.
Create a subnet group of RDS Holds the created subnets.

Create a RDS instance of PostgreSQL latest version.

define allocate storage as 20
engine as postgres
engine_version as LATEST
instance_calss as db.t3.micro
name as postgresqldatabase
username as postgres
password as CHOOSE ONE
db_security_group_ids as created
vpc_security_group_ids as created
skip_final_snapshot as true
DON'T FORGET THE TAGS
after deployed, Check connection using pgadmin program from you local device; this requires the RDS to be publicly accessable.
Requirement Specifications:
Resources must be created at us-east-1 region otherwise will fail.
Resources must have tags as below otherwise will fail
Key: "Environment" Value: "terraformChamps"
Key: "Owner" Value: "<type_your_name_here>"
Preferd to use variables.
