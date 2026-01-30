output "app_service_url" {
  description = "The public URL of the deployed web application."
  value       = module.app_service.app_service_url
}

output "database_hostname" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server."
  value       = module.database.database_hostname
}

