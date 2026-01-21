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

variable "login_server" {
  description = "ACR login server"
  type        = string
}

variable "image_name" {
  description = "image name"
  type        = string
}

variable "image_tag" {
  description = "image tag"
  type        = string
}
