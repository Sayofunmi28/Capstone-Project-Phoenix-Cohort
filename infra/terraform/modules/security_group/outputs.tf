output "security_group_id" {
  description = "ID of the security group attached to the k3s nodes."
  value       = aws_security_group.k3s_nodes.id
}

output "security_group_name" {
  description = "Name of the security group attached to the k3s nodes."
  value       = aws_security_group.k3s_nodes.name
}

