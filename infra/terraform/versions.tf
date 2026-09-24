terraform {
  # Specify the required Terraform version and providers to ensure compatibility and proper functioning.
  # minimum required version of Terraform is set to 1.5.0which ensures users compatible version.
  required_version = ">= 1.5.0"

  required_providers {
    # AWS provider - our primary provider for managing AWS resources.
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}