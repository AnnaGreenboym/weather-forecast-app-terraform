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

variable "vnet_cidr" {
  type    = string
}

variable "db_subnet_cidr" {
  type    = string
}

variable "app_subnet_cidr" {
  type    = string
}
