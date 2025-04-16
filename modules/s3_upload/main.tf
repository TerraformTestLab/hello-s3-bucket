resource "aws_s3_object" "upload_json" {
  bucket       = var.bucket_name
  key          = "jsons/${var.timestamp}_data.json"
  source       = var.json_file_path
  content_type = "application/json"
  acl          = "private"
}
