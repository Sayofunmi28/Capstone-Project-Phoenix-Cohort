output "control_plane_public_ip" {
  description = "Public IP address of the k3s control plane."
  value       = aws_instance.k3s_server.public_ip
}

output "control_plane_private_ip" {
  description = "Private IP address of the k3s control plane."
  value       = aws_instance.k3s_server.private_ip
}

output "worker_public_ips" {
  description = "Public IP addresses of the worker nodes."
  value = [
    aws_instance.worker_1.public_ip,
    aws_instance.worker_2.public_ip
  ]
}

output "worker_private_ips" {
  description = "Private IP addresses of the worker nodes."
  value = [
    aws_instance.worker_1.private_ip,
    aws_instance.worker_2.private_ip
  ]
}

output "node_public_ips" {
  description = "Public IP addresses of all k3s nodes."
  value = [
    aws_instance.k3s_server.public_ip,
    aws_instance.worker_1.public_ip,
    aws_instance.worker_2.public_ip
  ]
}

output "node_private_ips" {
  description = "Private IP addresses of all k3s nodes."
  value = [
    aws_instance.k3s_server.private_ip,
    aws_instance.worker_1.private_ip,
    aws_instance.worker_2.private_ip
  ]
}

output "control_plane_instance_id" {
  description = "Instance ID of the k3s control plane."
  value       = aws_instance.k3s_server.id
}

output "worker_instance_ids" {
  description = "Instance IDs of the worker nodes."
  value = [
    aws_instance.worker_1.id,
    aws_instance.worker_2.id
  ]
}