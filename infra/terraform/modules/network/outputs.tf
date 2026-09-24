output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.phoenix-cp.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC."
  value       = aws_vpc.phoenix-cp.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = aws_subnet.public[*].id
}