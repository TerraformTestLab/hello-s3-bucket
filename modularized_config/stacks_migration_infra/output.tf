output "project_url" {
  value = "https://app.terraform.io/app/${var.organization_name}/projects/${tfe_project.stack_project.id}"
}

output "stack_url" {
  value = "https://app.terraform.io/app/${var.organization_name}/projects/${tfe_project.stack_project.id}/stacks/${tfe_stack.stack.id}"
}