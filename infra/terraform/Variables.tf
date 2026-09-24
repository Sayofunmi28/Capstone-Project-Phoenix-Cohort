variable "aws_region" {
  description = "AWS region where the k3s cluster will be deployed."
  type        = string
}

variable "project_name" {
  description = "Name prefix used for AWS resources."
  type        = string
  default     = "k3s-capstone"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones where the public subnets will be created."
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) >= 3
    error_message = "At least 3 availability zones are required."
  }
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) >= 3
    error_message = "At least 3 public subnet CIDRs are required."
  }
}

variable "ami_id" {
  description = "AMI ID used for all k3s EC2 nodes."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type used for k3s nodes."
  type        = string
  default     = "t3.medium"
}

variable "worker_instance_type" {
  description = "EC2 instance type used for k3s worker nodes."
  type        = string
  default     = "t3.small"
}

variable "ssh_cidr" {
  description = "Public IPv4 CIDR allowed to SSH into the k3s nodes. Example: 203.0.113.10/32."
  type        = string
}

variable "k3s_token" {
  description = "Shared secret used by k3s nodes to authenticate when joining the cluster."
  type        = string
  sensitive   = true
}

variable "k3s_version" {
  description = "Pinned k3s version to install on all nodes."
  type        = string
}

variable "cluster_name" {
  description = "Name assigned to the k3s cluster."
  type        = string
  default     = "capstone"
}

variable "worker_count" {
  description = "Number of k3s worker nodes to create."
  type        = number
  default     = 2

  validation {
    condition     = var.worker_count >= 2
    error_message = "worker_count must be at least 2."
  }
}

variable "root_volume_size_gb" {
  description = "Size of the root EBS volume for each EC2 node in GiB."
  type        = number
  default     = 30

  validation {
    condition     = var.root_volume_size_gb >= 20
    error_message = "root_volume_size_gb must be at least 20 GiB."
  }
}
