provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket  = "rsschool-tfstate-yauheni-240611"
    key     = "state/task_3.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }
}
