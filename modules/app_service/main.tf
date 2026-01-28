data "azurerm_container_registry" "acr" {
  name                = var.acr_name 
  resource_group_name = var.acr_resource_group_name 
}

resource "azurerm_service_plan" "plan" {
  name                = "${var.prefix}-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.prefix}-consolee"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.plan.id
  virtual_network_subnet_id = var.app_subnet_id

  site_config {
    container_registry_use_managed_identity = true
    application_stack {
      docker_registry_url = "https://${var.login_server}"
      docker_image_name   = var.image_name
    }
  }

  app_settings = {
    WEBSITES_PORT = "5000"
    OPENWEATHER_API_KEY = var.api_key
    DATABASE_URL = "postgresql://${var.admin_login}:${var.admin_password}@${var.database_hostname}:5432/${var.database_name}"
    SECRET_KEY = var.app_encryption_key
  }

  identity { type = "SystemAssigned" }
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = data.azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_linux_web_app.app.identity[0].principal_id
}
