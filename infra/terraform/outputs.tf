output "control_plane_public_ip" {
  description = "Public IP address of the k3s control-plane node."
  value       = module.compute.control_plane_public_ip
}

output "control_plane_private_ip" {
  description = "Private IP address of the k3s control-plane node."
  value       = module.compute.control_plane_private_ip
}

output "worker_public_ips" {
  description = "Public IP addresses of the k3s worker nodes."
  value       = module.compute.worker_public_ips
}

output "worker_private_ips" {
  description = "Private IP addresses of the k3s worker nodes."
  value       = module.compute.worker_private_ips
}

output "node_public_ips" {
  description = "Public IP addresses of all k3s nodes."
  value       = module.compute.node_public_ips
}

output "node_private_ips" {
  description = "Private IP addresses of all k3s nodes."
  value       = module.compute.node_private_ips
}

output "control_plane_instance_id" {
  description = "EC2 instance ID of the k3s control-plane node."
  value       = module.compute.control_plane_instance_id
}

output "worker_instance_ids" {
  description = "EC2 instance IDs of the k3s worker nodes."
  value       = module.compute.worker_instance_ids
}

output "ansible_inventory" {
  description = "Private IP addresses grouped for Ansible."
  value = {
    k3s_server = [
      module.compute.control_plane_private_ip
    ]

    k3s_agents = module.compute.worker_private_ips
  }
}

