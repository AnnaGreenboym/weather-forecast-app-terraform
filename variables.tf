variable "prefix" {
  description = "A unique prefix for all resource names to avoid naming conflicts."
  type        = string
  default     = "weather-app"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "Israel Central"
}

variable "postgres_admin_login" {
  description = "The administrator username for the PostgreSQL database."
  type        = string
  default     = "postadmin"
}

# variable "postgres_admin_password" {
#   description = "The administrator password for the PostgreSQL database. MUST be complex."
#   type        = string
#   sensitive   = true
#   default     = data.azurerm_key_vault_secret.db_password.value
# }

# variable "api_key" {
#   description = "API key for weather service."
#   type        = string
#   sensitive   = true
#   default     = data.azurerm_key_vault_secret.api_key.value
# }

# variable "app_encryption_key" {
#   description = "Encryption key for the application."
#   type        = string
#   sensitive   = true
#   default     = data.azurerm_key_vault_key.app_encryption_key.key_vault_key_id
#}

variable "login_server" {
  description = "ACR login server"
  type        = string
  default     = "weatherimage.azurecr.io"
}

variable "image_name" {
  description = "image name"
  type        = string
  default     = "weather-app:latest"
}


