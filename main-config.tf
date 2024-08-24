# Terraform Settings Block
terraform {
  required_version = "~> 1.9.5" # Minor patches
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  # AWS Credentials Profile configured on local  $HOME/.aws/credentials
  profile = "default"
  region  = var.aws_region
}