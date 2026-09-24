variable "project_name" {
  type        = string
  description = "Name prefix for network resources."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones for the public subnets."

  validation {
    condition     = length(var.availability_zones) >= 3
    error_message = "At least 3 availability zones are required."
  }
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the public subnets."

  validation {
    condition     = length(var.public_subnet_cidrs) >= 3
    error_message = "At least 3 public subnet CIDRs are required."
  }
}