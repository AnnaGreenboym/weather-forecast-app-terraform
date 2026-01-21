data "http" "myip" {
  url = "https://api.ipify.org"
}

# Data source to get information about your Azure account
data "azurerm_client_config" "current" {}

# 1. Resource Group - This stays in the root module as it's the container for everything.
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
}

# 2. App Service Module
module "app_service" {
  source = "./modules/app_service" # Path to the module folder

  prefix              = var.prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  login_server        = var.login_server
  image_name          = var.image_name
  image_tag           = var.image_tag
  container_port      = var.container_port
}

# 3. Database Module
module "database" {
  source = "./modules/database" # Path to the module folder

  prefix                 = var.prefix
  location               = var.location
  resource_group_name    = azurerm_resource_group.rg.name
  admin_login            = var.postgres_admin_login
  admin_password         = var.postgres_admin_password
  local_developer_ip     = data.http.myip.response_body
}

# 4. Key Vault Module
module "key_vault" {
  source = "./modules/key_vault" # Path to the module folder

  prefix                  = var.prefix
  location                = var.location
  resource_group_name     = azurerm_resource_group.rg.name
  tenant_id               = data.azurerm_client_config.current.tenant_id
  app_service_principal_id = module.app_service.app_identity_principal_id # Get output from another module
}
