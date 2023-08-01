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
    }