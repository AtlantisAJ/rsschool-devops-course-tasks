variable "region" {
  description = "AWS region for resources"
  default     = "eu-central-1"
  type        = string
}

variable "key_name" {
  description = "SSH key name in AWS"
  default     = "NAT-key-Jenya"
}

variable "public_subnet_id" {
  description = "Subnet ID for bastion"
}

variable "bastion_ami" {
  default = "ami-02003f9f0fde924ea"
}

variable "bastion_instance_type" {
  default = "t3.micro"
}
