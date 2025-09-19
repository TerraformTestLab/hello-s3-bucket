variable "bucket_name" {
  description = "The name of the S3 bucket to upload files to"
  type        = string
}

variable "json_file_path" {
  description = "The path to the JSON file to upload"
  type        = string
}

variable "timestamp" {
  description = "The timestamp to use in the S3 object key"
  type        = string
}