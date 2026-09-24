module "network" {
  source = "./modules/network"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "security_group" {
  source = "./modules/security_group"

  project_name = var.project_name
  vpc_id       = module.network.vpc_id
  vpc_cidr     = module.network.vpc_cidr
  ssh_cidr     = var.ssh_cidr
}

module "compute" {
  source = "./modules/compute"

  project_name         = var.project_name
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  worker_instance_type = var.worker_instance_type
  subnet_ids           = module.network.public_subnet_ids
  security_group_id    = module.security_group.security_group_id
  k3s_token            = var.k3s_token
  k3s_version          = var.k3s_version
  cluster_name         = var.cluster_name
  worker_count         = var.worker_count
  root_volume_size_gb  = var.root_volume_size_gb
}
