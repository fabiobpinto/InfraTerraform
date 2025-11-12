output "rg_name" {
  value       = azurerm_resource_group.rg_redis.name
  description = "The name of the resource group."
}
output "rg_location" {
  value       = azurerm_resource_group.rg_redis.location
  description = "The location of the resource group."
}