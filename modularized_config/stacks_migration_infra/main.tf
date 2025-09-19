terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = ">= 0.67.0"
    }
    tfmigrate = {
      source  = "hashicorp/tfmigrate"
      version = "1.3.0-alpha20250917"
    }
  }
}

provider "tfe" {
  hostname     = var.tfe_hostname
  organization = var.organization_name
}

resource "tfe_project" "stack_project" {
  name         = var.project_name
  organization = var.organization_name
}

resource "tfe_stack" "stack" {
  name         = var.stack_name
  project_id   =  tfe_project.stack_project.id
}

resource "tfmigrate_stack_migration" "stack_migration" {
  config_file_dir = var.stacks_config_file_dir
  organization    = var.organization_name
  name            = tfe_stack.stack.name
  project         = tfe_project.stack_project.name
  terraform_config_dir = var.terraform_config_dir
  workspace_deployment_mapping = var.workspace_deployment_mapping
}