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

  # This app setting is required to tell the App Service which port the container is listening on.
  app_settings = {
    "WEBSITES_PORT" = "8000"
  }

  site_config {
    # This block tells the App Service to run a Docker container.
    application_stack {
      docker_image_name   = "${var.docker_image_name}:latest"
      docker_registry_url = "https://${var.acr_login_server}"
    }
  }
  
  identity {
    type = "SystemAssigned"
  }
}
