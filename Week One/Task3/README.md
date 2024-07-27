# Terraform S3 Bucket and Lifecycle Configuration

This project uses Terraform to create and manage an Amazon S3 bucket with specific directories and lifecycle rules. The state file is stored in a dedicated S3 bucket.

## Resources

- **S3 Bucket**
  - Create a unique S3 bucket.
  
- **Directories**
  - Create directories: `/log`, `/outgoing`, `/incoming`.

- **Lifecycle Rules**
  - **/log Directory**
    - Transition all files to infrequent access (Standard-IA) 30 days after creation.
    - Transition all files to Archive access (Glacier) 90 days after creation.
    - Transition all files to Deep Archive access (Glacier Deep Archive) 180 days after creation.
    - Remove all files 365 days after creation.
    
  - **/outgoing Directory**
    - Transition files with tag `notDeepArchive` to infrequent access (Standard-IA) 30 days after creation.
    - Transition files with tag `notDeepArchive` to Archive access (Glacier) 90 days after creation.
    
  - **/incoming Directory**
    - Transition files between 1MB and 1GB to infrequent access (Standard-IA) 30 days after creation.
    - Transition files between 1MB and 1GB to Archive access (Glacier) 90 days after creation.
