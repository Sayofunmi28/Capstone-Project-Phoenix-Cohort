provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      project   = var.project_name
      ManagedBy = "Terraform"
      Owner     = "Sayofunmi"
      CreatedBy = "Terraform"

    }
  }
  retry_mode  = "standard"
  max_retries = 5
}