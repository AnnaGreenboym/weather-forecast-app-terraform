data "http" "myip" {
  url = "https://api.ipify.org"
}

# 1. Resource Group - This stays in the root module as it's the container for everything.
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
}

# 2. Network Module
module "network" {
  source = "./modules/network"

  prefix                 = var.prefix
  location               = var.location
  resource_group_name    = azurerm_resource_group.rg.name
  vnet_cidr              = var.vnet_cidr
  db_subnet_cidr         = var.db_subnet_cidr
  app_subnet_cidr        = var.app_subnet_cidr
}

# 3. Database Module
module "database" {
  source = "./modules/database"

  prefix                 = var.prefix
  location               = var.location
  database_name          = var.database_name
  admin_login            = var.postgres_admin_login
  resource_group_name    = azurerm_resource_group.rg.name
  admin_password         = data.azurerm_key_vault_secret.db_password.value
  local_developer_ip     = data.http.myip.response_body
  db_subnet_id           = module.network.db_subnet_id
  private_dns_zone_id    = module.network.private_dns_zone_id

  depends_on             = [module.network]
}

# 2. App Service Module
module "app_service" {
  source = "./modules/app_service" 

  prefix              = var.prefix
  location            = var.location
  login_server        = var.login_server
  image_name          = var.image_name
  admin_login         = var.postgres_admin_login
  database_name       = var.database_name
  acr_name            = var.acr_name
  acr_rg_name         = var.acr_rg_name 
  resource_group_name = azurerm_resource_group.rg.name
  admin_password      = data.azurerm_key_vault_secret.db_password.value
  api_key             = data.azurerm_key_vault_secret.api_key.value
  app_encryption_key  = data.azurerm_key_vault_secret.app_encryption_secret.value
  database_hostname   = module.database.database_hostname
  app_subnet_id       = module.network.app_subnet_id

  depends_on          = [module.database]
       
}


