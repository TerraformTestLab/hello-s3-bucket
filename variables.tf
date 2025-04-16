variable "enaable_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = false
}

variable "bucket_name_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
}

variable "force_destroy" {
  description = "Force destroy the S3 bucket"
  type        = bool
  default     = false
}