resource "azurerm_resource_group" "rg_redis" {
  name     = var.rg_name
  location = var.location
}