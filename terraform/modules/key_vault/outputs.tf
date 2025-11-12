output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.kv_redis.id
}

output "key_vault_key_id" {
  value = azurerm_key_vault_key.kv_key_redis.id
}