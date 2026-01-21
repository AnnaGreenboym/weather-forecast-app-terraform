resource "azurerm_service_plan" "plan" {
  name                = "${var.prefix}-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.prefix}-webapp"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      docker_registry_url = "https://${var.login_server}"
      docker_image_name   = var.image_name
      docker_image_tag    = var.image_tag   # e.g. "latest"
    }
  }

  app_settings = {
    # Required for many containers on App Service
    WEBSITES_PORT = tostring(var.container_port)  # e.g. 8000

    # Your app env vars
  }

  identity { type = "SystemAssigned" }
}

