variable "prefix" {
  description = "The unique prefix for resource names."
  type        = string
}

variable "location" {
  description = "The Azure region for the resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "app_github_repo_url" {
  description = "The URL of the Python application's GitHub repository."
  type        = string
}
