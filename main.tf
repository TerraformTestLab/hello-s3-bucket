terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
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

locals {
  separator = "-"
}

provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = var.default_tags
  }
}

data "aws_availability_zones" "available" {}

resource "random_pet" "bucket-name" {
  prefix    = var.bucket_name_prefix
  separator = local.separator
  length    = 2
}

resource "time_static" "current_time" {}

module "s3-bucket" {
  source               = "terraform-aws-modules/s3-bucket/aws"
  availability_zone_id = data.aws_availability_zones.available.names[0]
  bucket               = lower(random_pet.bucket-name.id)
  versioning = {
    enabled = var.enaable_versioning
  }
  force_destroy = var.force_destroy
}

resource "local_file" "json_file" {
  content = jsonencode({
    name       = module.s3-bucket.s3_bucket_arn
    domain     = module.s3-bucket.s3_bucket_bucket_domain_name
    created_at = time_static.current_time.rfc3339
  })
  filename = "${path.module}/jsons/generated.json"
}

module "s3_upload" {
  source         = "./modules/s3_upload"
  json_file_path = "${path.module}/jsons/generated.json"
  bucket_name    = module.s3-bucket.s3_bucket_id
  timestamp      = formatdate("DD-MM-YYYY hh:mm", time_static.current_time.rfc3339)
}
