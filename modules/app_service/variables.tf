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

variable "acr_login_server" {
  description = "The login server of the Azure Container Registry."
  type        = string
}

variable "acr_admin_username" {
  description = "The admin username for the ACR."
  type        = string
}

variable "acr_admin_password" {
  description = "The admin password for the ACR."
  type        = string
  sensitive   = true
}

variable "docker_image_name" {
  description = "The name of the Docker image."
  type        = string
}
