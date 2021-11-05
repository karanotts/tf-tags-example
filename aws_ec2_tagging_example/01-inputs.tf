variable "environment" {
  default = "sbox"
}

variable "project" {
  default = "project-a"
}

variable "ami" {
  description = "AMI to use for the instance."
  default     = "ami-0ed961fa828560210"
}

variable "instance_type" {
  description = "The instance type to use for the instance."
  default     = "t2.micro"
}

locals {
  tags = module.tags.tags
}

module "tags" {
  source      = "../tags"
  environment = var.environment
  project     = var.project
}
