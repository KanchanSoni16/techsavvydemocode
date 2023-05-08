terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

provider "aws" {
  # Configuration options
  access_key = "AKIAU7M2C7NBO77BB5U2"
  secret_key = "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"
  region = "us-east-1"
}