
# Terraform Settings Block
terraform {
    # Terraform version needed to execute the manifest file
    required_version = "~> 0.14.5"

    # Terraform Providers Required
    required_providers {
    aws = {
      version = ">= 5.1.0"
      source = "hashicorp/aws"
    }
    }

 # Backend, state file
 #backend "gcs"
 backend "s3" {
    bucket = ""
    region = ""
    key = ""

 }

# experimental
# metadata to provider

}






# Configure the AWS Provider

provider "aws" {
  region = "us-east-1"
}


# Configure the Google Provider

provider "google" {
  region      = "us-central1"
}
