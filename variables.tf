variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "Ubuntu Linux 22.04 LTS"
  default     = "ami-0a7d80731ae1b2435"
}

variable "key_name" {
  default = "AnsibleEC2"
}
