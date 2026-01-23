terraform {
  backend "azurerm" {
    resource_group_name  = "rg-working-israel"
    storage_account_name = "stweathert"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
