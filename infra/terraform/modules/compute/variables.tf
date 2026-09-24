variable "project_name" {
  type        = string
  description = "Name prefix for compute resources."
}

variable "ami_id" {
  type        = string
  description = "AMI ID used for all k3s nodes."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for the k3s control plane."
}

variable "worker_instance_type" {
  type        = string
  description = "EC2 instance type for k3s worker nodes."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs where nodes will be deployed."
}

variable "security_group_id" {
  type        = string
  description = "Security group attached to k3s nodes."
}

variable "k3s_token" {
  type        = string
  sensitive   = true
  description = "Shared secret used by k3s nodes to join the cluster."
}

variable "k3s_version" {
  type        = string
  description = "Pinned k3s version."
}

variable "cluster_name" {
  type        = string
  description = "Name of the k3s cluster."
}

variable "worker_count" {
  type        = number
  description = "Number of k3s worker nodes."

  validation {
    condition     = var.worker_count >= 2
    error_message = "worker_count must be at least 2."
  }
}

variable "root_volume_size_gb" {
  type        = number
  description = "Root EBS volume size in GiB."
  default     = 30
}