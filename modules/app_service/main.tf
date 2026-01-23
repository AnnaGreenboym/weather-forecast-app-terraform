data "azurerm_container_registry" "acr" {
  name                = "weatherimage"
  resource_group_name = "rg-working-israel"
}

resource "azurerm_service_plan" "plan" {
  name                = "${var.prefix}-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.prefix}-console"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    container_registry_use_managed_identity = true
    application_stack {
      docker_registry_url = "https://${var.login_server}"
      docker_image_name   = var.image_name
    }
  }

  app_settings = {
    # Required for many containers on App Service
    #WEBSITES_PORT = tostring(var.container_port)  # e.g. 8000
    WEBSITES_PORT = "5000"

    # Your app env vars
  }

  identity { type = "SystemAssigned" }
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = data.azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_linux_web_app.app.identity[0].principal_id
}
