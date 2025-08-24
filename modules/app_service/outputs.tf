output "app_service_url" {
  description = "The public URL of the web app."
  value       = "https://${azurerm_linux_web_app.app.default_hostname}"
}

output "app_identity_principal_id" {
  description = "The principal ID of the App Service's managed identity."
  value       = azurerm_linux_web_app.app.identity[0].principal_id
}
