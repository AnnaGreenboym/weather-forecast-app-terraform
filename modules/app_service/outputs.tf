output "app_service_url" {
  description = "The public URL of the web app."
  value       = "https://${azurerm_linux_web_app.app.default_hostname}"
}
