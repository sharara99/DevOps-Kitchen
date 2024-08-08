Week Four Workshop

At the end of the week, submit the following workshop.
 use IaC Terraform to build the following resource besides requirement specifications:
 In the following task will walk through the s3 creation, ec2 creation, create IAM Role holds s3 full access permission and attach it to the ec2, Then test accessibility by sending file to s3 from the ec2 machine using AWS CLI s3 and s3api using Terrafrom

* Use S3 to store Terraform statefile using "erakiterrafromstatefiles" bucket
* Consider to use different name that others (i.e. specify a unique name for state file key)
* Create a general purpose Bucket.
* Create a Directory under created S3 called "logs".
* Create IAM Role for The ec2 machine have s3 full access aws managed policy.
* Create an ec2 machine holds the above role.
* Check accessibility using AWS CLI, by sending a file to s3 bucket from The EC2 machine.
* After all Create a fork from this repository, Then append your code at the code samples section below and request to accept.
