output "database_hostname" {
  description = "The FQDN of the PostgreSQL server."
  value       = azurerm_postgresql_flexible_server.db.fqdn
}
