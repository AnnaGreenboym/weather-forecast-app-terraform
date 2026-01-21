variable "prefix" {
  description = "A unique prefix for all resource names to avoid naming conflicts."
  type        = string
  default     = "weather-app"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "eastus"
}

variable "postgres_admin_login" {
  description = "The administrator username for the PostgreSQL database."
  type        = string
  default     = "admin"
}

variable "postgres_admin_password" {
  description = "The administrator password for the PostgreSQL database. MUST be complex."
  type        = string
  sensitive   = true
}

variable "login_server" {
  description = "ACR login server"
  type        = string
  default     = "weathercontainerregistry.azurecr.io"
}

variable "image_name" {
  description = "image name"
  type        = string
  default     = "weather-app:latest"
}


