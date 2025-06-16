variable "region" {
  description = "AWS region for resources"
  default     = "eu-central-1"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  default     = "rsschool-tfstate-yauheni-240611"
  type        = string
}
