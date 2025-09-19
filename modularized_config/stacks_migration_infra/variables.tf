variable "organization_name" {
  default = "SujaysTerraformLab"
}

variable "tfe_hostname" {
  default = "app.terraform.io"
}

variable "project_name" {
  default = "example-project"
}

variable "stack_name" {
  default = "example-stack"
}

variable "stacks_config_file_dir" {
  default = "/Users/sujaysamanta/test-tf-migrate-modularization/hello-s3-bucket/modularized_config/_stacks_generated"
}

variable "terraform_config_dir" {
  default = "/Users/sujaysamanta/test-tf-migrate-modularization/hello-s3-bucket/modularized_config"
}

variable "workspace_deployment_mapping" {
  default = {
    hello-s3-bucket-VCS = "hello-s3-bucket-VCS-deployment"
  }
}
