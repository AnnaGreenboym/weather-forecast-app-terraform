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

data "azurerm_key_vault_secret" "app_encryption_secret" {
  name         = "key-app-weather"
  key_vault_id = data.azurerm_key_vault.existing_keyvault.id
}
