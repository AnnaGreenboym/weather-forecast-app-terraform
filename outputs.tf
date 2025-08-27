output "app_service_url" {
  description = "The public URL of the deployed web application."
  value       = module.app_service.app_service_url
}

output "database_hostname" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server."
  value       = module.database.database_hostname
}

output "key_vault_uri" {
  description = "The URI of the Key Vault for storing secrets."
  value       = module.key_vault.key_vault_uri
}

output "container_registry_login_server" {
  description = "The login server for the Azure Container Registry."
  value       = module.acr.login_server
}
