#!/bin/bash
# WARNING: This script cleans up all Terraform files from previous builds and deletes AWS resources.
# Use it only after you destroy all Terraform-managed resources to avoid losing the state that keeps track of them.

# Cleanup Terraform files
rm -rf terraform.tfstate
rm -rf terraform.tfstate.*
rm -rf .terraform
rm -rf .terraform.*
rm -rf terraform.tfstate.backup
