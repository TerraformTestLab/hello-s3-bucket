output "s3_bucket_region" {
  description = "The region of the S3 bucket"
  value       = module.terraform_module.s3_bucket_region
}

output "aws_availability_zones" {
  description = "The list of availability zones"
  value       = module.terraform_module.aws_availability_zones
}

output "s3_object_url" {
  description = "The URL of the uploaded JSON file in S3"
  value       = module.terraform_module.s3_object_url
}

output "last_modified" {
  description = "The last modified time of the uploaded JSON file"
  value       = module.terraform_module.last_modified
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.terraform_module.s3_bucket_arn
}

output "s3_bucket_id" {
  description = "The name of the S3 bucket"
  value       = module.terraform_module.s3_bucket_id
}

output "s3_bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = module.terraform_module.s3_bucket_domain_name
}

