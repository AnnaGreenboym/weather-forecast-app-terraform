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

variable "docker_image_name" {
  description = "The name of the Docker image to be deployed (e.g., your-repo/app)."
  type        = string
  default     = "aztek-weather-app"
}
