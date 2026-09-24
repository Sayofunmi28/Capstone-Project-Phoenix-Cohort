variable "project_name" {
  description = "Name prefix used for the Security group."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the Security group will be created."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC. Used to restrict Kubernetes and node-to-node traffic."
  type        = string
}

variable "ssh_cidr" {
  description = "Public IPv4 CIDR allowed to SSH into the k3s nodes. Example: 203.0.113.10/32."
  type        = string
}

