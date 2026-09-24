resource "aws_security_group" "k3s_nodes" {
  name   = "${var.project_name}-nodes"
  vpc_id = var.vpc_id

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_operator" {
  security_group_id = aws_security_group.k3s_nodes.id

  description = "SSH from operator"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4   = var.ssh_cidr
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.k3s_nodes.id

  description = "HTTP"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.k3s_nodes.id

  description = "HTTPS"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "k3s_api" {
  security_group_id = aws_security_group.k3s_nodes.id

  description = "k3s API"
  from_port   = 6443
  to_port     = 6443
  ip_protocol = "tcp"
  cidr_ipv4   = var.vpc_cidr
}

resource "aws_vpc_security_group_ingress_rule" "kubelet" {
  security_group_id = aws_security_group.k3s_nodes.id

  description = "kubelet"
  from_port   = 10250
  to_port     = 10250
  ip_protocol = "tcp"
  cidr_ipv4   = var.vpc_cidr
}

resource "aws_vpc_security_group_ingress_rule" "flannel_vxlan" {
  security_group_id = aws_security_group.k3s_nodes.id

  description = "Flannel VXLAN"
  from_port   = 8472
  to_port     = 8472
  ip_protocol = "udp"
  cidr_ipv4   = var.vpc_cidr
}

resource "aws_vpc_security_group_ingress_rule" "k3s_node_ssh" {
  security_group_id            = aws_security_group.k3s_nodes.id
  referenced_security_group_id = aws_security_group.k3s_nodes.id

  description = "SSH between k3s nodes"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}