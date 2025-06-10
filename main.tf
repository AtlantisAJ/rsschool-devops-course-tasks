provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = var.bucket_name
    key = "state/terraform.tfstate"
    region = var.region
    encrypt = "true"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }
}
