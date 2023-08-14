// Provider configuration
terraform {
  backend "s3" {
    bucket = "alvinjanuar.com-stacks"
    key = "prod/alvinjanuar.com/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  
  default_tags {
    tags = {
      Owner   = "Alvin"
      Project = "alvinjanuar.com"
    }
  }
  # Make it faster by skipping something
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

data "aws_route53_zone" "zone" {
  name         = "alvinjanuar.com"
  private_zone = false
}

locals {
  domain_name = [
    "alvinjanuar.com",
    "www.alvinjanuar.com"
  ]
}