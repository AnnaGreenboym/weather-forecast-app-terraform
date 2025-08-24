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
      python_version = "3.9"
    }
  }
  
  identity {
    type = "SystemAssigned"
  }
}

# This resource connects the App Service to the Python app's GitHub repository.
resource "azurerm_app_service_source_control" "app_source_control" {
  app_id   = azurerm_linux_web_app.app.id
  repo_url = var.app_github_repo_url
  branch   = "main"

  # This section configures the automatic deployment via GitHub Actions.
  # The action will use secrets stored in your app's GitHub repository for authentication.
  github_action_configuration {
    generate_workflow_file = true
    code_configuration {
      runtime_stack   = "python"
      runtime_version = "3.9"
    }
  }
}
