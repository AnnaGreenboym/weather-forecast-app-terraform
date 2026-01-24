data "azurerm_key_vault" "existing_keyvault" {
  name                = "vaultweather"
  resource_group_name = "rg-working-israel"
}

data "azurerm_key_vault_secret" "db_password" {
  name         = "database-weather-secret"
  key_vault_id = data.azurerm_key_vault.existing_keyvault.id
}

data "azurerm_key_vault_secret" "api_key" {
  name         = "api-weather-key"
  key_vault_id = data.azurerm_key_vault.existing_keyvault.id
}

data "azurerm_key_vault_key" "app_encryption_key" {
  name         = "key-app-weather"
  key_vault_id = data.azurerm_key_vault.existing_keyvault.id
}

variable "postgres_admin_password" {
  description = "The administrator password for the PostgreSQL database. MUST be complex."
  type        = string
  sensitive   = true
  default     = data.azurerm_key_vault_secret.db_password.value
}

variable "api_key" {
  description = "API key for weather service."
  type        = string
  sensitive   = true
  default     = data.azurerm_key_vault_secret.api_key.value
}

variable "app_encryption_key" {
  description = "Encryption key for the application."
  type        = string
  sensitive   = true
  default     = data.azurerm_key_vault_key.app_encryption_key.key_vault_key_id
}