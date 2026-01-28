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


variable "api_key" {
  description = "API key for weather service."
  type        = string
  sensitive   = true
}

variable "app_encryption_key" {
  description = "Encryption key for the application."
  type        = string
  sensitive   = true
}

variable "admin_login" {
  description = "The admin username for the PostgreSQL server."
  type        = string
  
}

variable "admin_password" {
  description = "value from key vault"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "The name of the PostgreSQL database."
  type        = string
}

variable "database_hostname" {
  description = "The FQDN of the PostgreSQL server."
  type        = string

}

variable "app_subnet_cidr" {
  type        = string

}