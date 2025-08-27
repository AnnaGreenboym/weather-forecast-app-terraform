data "http" "myip" {
  url = "https://api.ipify.org"
}
data "azurerm_client_config" "current" {}

# 1. Resource Group (no change)
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
}

# 2. Azure Container Registry (ACR) Module - NEW
module "acr" {
  source = "./modules/container_registry"

  prefix              = var.prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

# 3. App Service Module - UPDATED
# Now takes the ACR details as input.
module "app_service" {
  source = "./modules/app_service"

  prefix                  = var.prefix
  location                = var.location
  resource_group_name     = azurerm_resource_group.rg.name
  acr_login_server        = module.acr.login_server
  acr_admin_username      = module.acr.admin_username
  acr_admin_password      = module.acr.admin_password
  docker_image_name       = var.docker_image_name
}

# 4. Database Module (no change)
module "database" {
  source = "./modules/database"

  prefix                 = var.prefix
  location               = var.location
  resource_group_name    = azurerm_resource_group.rg.name
  admin_login            = var.postgres_admin_login
  admin_password         = var.postgres_admin_password
  local_developer_ip     = data.http.myip.response_body
}

# 5. Key Vault Module (no change)
module "key_vault" {
  source = "./modules/key_vault"

  prefix                   = var.prefix
  location                 = var.location
  resource_group_name      = azurerm_resource_group.rg.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  app_service_principal_id = module.app_service.app_identity_principal_id
}
