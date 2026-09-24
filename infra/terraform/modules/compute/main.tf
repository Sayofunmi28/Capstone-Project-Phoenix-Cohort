resource "aws_key_pair" "capstone" {
  key_name   = "capstone-ssh-key"
  public_key = file(pathexpand("~/.ssh/id_ed25519.pub"))

  tags = {
    Name    = "capstone-ssh-key"
    Project = "TSA-Capstone"
  }
}

resource "aws_instance" "k3s_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_ids[0]

  key_name = aws_key_pair.capstone.key_name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  root_block_device {
    volume_size = var.root_volume_size_gb
    volume_type = "gp3"
  }

  tags = {
    Name = "k3s-server"
  }
}

resource "aws_instance" "worker_1" {
  ami           = var.ami_id
  instance_type = var.worker_instance_type

  subnet_id = var.subnet_ids[1]

  key_name = aws_key_pair.capstone.key_name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  user_data = templatefile("${path.module}/templates/agent.sh.tftpl", {
    server_private_ip = aws_instance.k3s_server.private_ip
    k3s_version       = var.k3s_version
    k3s_token         = var.k3s_token
  })

  root_block_device {
    volume_size = var.root_volume_size_gb
    volume_type = "gp3"
  }

  tags = {
    Name = "worker-1"
  }
}

resource "aws_instance" "worker_2" {
  ami           = var.ami_id
  instance_type = var.worker_instance_type

  subnet_id = var.subnet_ids[2]

  key_name = aws_key_pair.capstone.key_name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  user_data = templatefile("${path.module}/templates/agent.sh.tftpl", {
    server_private_ip = aws_instance.k3s_server.private_ip
    k3s_version       = var.k3s_version
    k3s_token         = var.k3s_token
  })

  root_block_device {
    volume_size = var.root_volume_size_gb
    volume_type = "gp3"
  }

  tags = {
    Name = "worker-2"
  }
}