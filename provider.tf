# Terraform Provider
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}

# Aws provider
provider "aws" {
    region = "us-east-1"
  
}