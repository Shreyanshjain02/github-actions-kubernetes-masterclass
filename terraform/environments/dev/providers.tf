provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "skillpulse"
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}