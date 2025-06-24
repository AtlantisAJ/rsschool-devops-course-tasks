variable "region" {
  description = "AWS region for resources"
  default     = "eu-central-1"
  type        = string
}

variable "key_name" {
  description = "SSH key name in AWS"
  default     = "NAT-key-Jenya"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "public_subnet_id" {
  description = "Subnet ID for bastion"
}
