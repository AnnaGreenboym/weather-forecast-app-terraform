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

variable "tenant_id" {
  description = "The Azure Tenant ID."
  type        = string
}

variable "app_service_principal_id" {
  description = "The principal ID of the App Service's managed identity."
  type        = string
}
