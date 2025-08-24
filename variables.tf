variable "prefix" {
  description = "A unique prefix for all resource names to avoid naming conflicts."
  type        = string
  default     = "aztek-weather-app"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "North Europe"
}

variable "postgres_admin_login" {
  description = "The administrator username for the PostgreSQL database."
  type        = string
  default     = "aztekadmin"
}

variable "postgres_admin_password" {
  description = "The administrator password for the PostgreSQL database. MUST be complex."
  type        = string
  sensitive   = true
}

variable "app_github_repo_url" {
  description = "The URL of the separate GitHub repository containing the Python application code."
  type        = string
}
