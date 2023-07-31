terraform {
    required_version = "~> 1.5.0" # Constraints
    # Terraform Providers Required
    required_providers {
    aws = {
      version = "~> 4.47.0"
      source = "hashicorp/aws"
    }
    google = {
      source = "hashicorp/google"
       }
    }
    
}

# Providers info

provider "aws" {
    region = "us-east-1"
    profile = "default"
    access_key = "AKIA2YN3FT5I5DOMBFZV"
    secret_key = "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"
    
    }