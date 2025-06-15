# rsschool DevOps Course Task 1

## Overview
This repository sets up an AWS S3 bucket for Terraform state and an IAM role for GitHub Actions using Terraform. A GitHub Actions workflow automates Terraform checks, planning, and deployment.

## Prerequisites
- AWS CLI v2
- Terraform v1.6+
- AWS account with IAM user (MFA enabled) and policies: AmazonEC2FullAccess, AmazonS3FullAccess, AmazonRoute53FullAccess, IAMFullAccess, AmazonVPCFullAccess, AmazonSQSFullAccess, AmazonEventBridgeFullAccess.
- GitHub repository `rsschool-devops-course-tasks`

## Setup
1. **Install AWS CLI and Terraform**:
   ```bash
   aws --version
   terraform version
2. **Configure AWS CLI:**
    ```bash
    aws configure

3. **Run Terraform:**
    ```bash
    terraform init -backend-config=backend.hcl
    terraform plan
    terraform apply

##  GitHub Actions
The workflow .github/workflows/terraform.yml includes:

terraform-check: Runs terraform fmt -check to verify code formatting.
terraform-plan: Runs terraform plan to generate a deployment plan.
terraform-apply: Runs terraform apply on push to main branch.

## Resources
S3 bucket: rsschool-tfstate-yauheni-240611
IAM role: GithubActionsRole
