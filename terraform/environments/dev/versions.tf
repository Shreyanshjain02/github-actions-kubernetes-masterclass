terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "sj-skillpulse-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "sj-terraform-locks"
    encrypt        = true
  }
}