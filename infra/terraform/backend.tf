terraform {
  backend "s3" {
    bucket       = "taskapp-phoenix-terraform-state-2026"
    key          = "terraform.tfstate"
    region       = "eu-north-1"
    use_lockfile = true
    encrypt      = true
  }
}