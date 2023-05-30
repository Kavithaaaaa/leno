terraform {
  required_version = "~> 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.7.1"
    }
  }
}
# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
  region  = "us-east-1"
}
