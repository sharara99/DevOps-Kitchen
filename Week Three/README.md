Week Three Workshop
At the end of the week, submit the following workshop.
use IaC Terrafrom to build the following resource besides requirement specifications:
In the following task will walk through the S3 creation, create IAM users and roles, configure S3 Policy, and test accessibility using AWS CLI s3 and s3api using IAM user credentials and IAM Role credentials using Terrafrom

* Use S3 to store Terraform statefile using "erakiterrafromstatefiles" bucket
* Consider to use difrrent name that others (i.e. specify a unique name for state file key)
* Create a general purpose Bucket.
* Create a Directory under created S3 called "logs".
* Create two IAM Users (Mostafa, Taha).
* Create IAM Role for Taha have s3:GetObject policy from logs directory only.
* Set an S3 Policy allow Mostafa to put objects (i.e. s3:PutObject) at the entire S3.
* Check accessability using AWS CLI:
    *  Utilizing AWS CLI s3 commands.
    * Utilizing AWS CLI s3api commands.
*  After all Create a fork from this repository, Then append your code at the code samples section below and request to accept.