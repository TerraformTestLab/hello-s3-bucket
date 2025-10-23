terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.7"
    }
  }

  required_version = ">= 1.9"
}

provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = var.default_tags
  }
}

module "terraform_module" {
  source             = "./terraform_modules"
  enaable_versioning = var.enaable_versioning
  bucket_name_prefix = var.bucket_name_prefix
  force_destroy      = var.force_destroy
  default_tags       = var.default_tags
}
