resource "azurerm_postgresql_flexible_server" "db" {
  name                   = "${var.prefix}-db"
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "14"
  
  administrator_login    = var.admin_login
  administrator_password = var.admin_password

  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  
  public_network_access_enabled = true
}

resource "azurerm_postgresql_flexible_server_database" "appdb" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.db.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}


resource "azurerm_postgresql_flexible_server_firewall_rule" "local_access" {
  name             = "allow-local-dev-ip"
  server_id        = azurerm_postgresql_flexible_server.db.id
  start_ip_address = var.local_developer_ip
  end_ip_address   = var.local_developer_ip
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "azure_services_access" {
  name             = "allow-azure-internal"
  server_id        = azurerm_postgresql_flexible_server.db.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
