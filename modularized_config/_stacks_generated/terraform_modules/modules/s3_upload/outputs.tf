output "s3_object_url" {
  description = "The URL of the uploaded JSON file in S3"
  value       = "https://${aws_s3_object.upload_json.bucket}.s3.amazonaws.com/${aws_s3_object.upload_json.key}"
}