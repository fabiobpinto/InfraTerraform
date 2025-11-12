# Identidade gerenciada para o Redis acessar o Key Vault
resource "azurerm_user_assigned_identity" "redis_identity" {
  name                = "${var.redis_name}-identity"
  location            = var.location
  resource_group_name = var.rg_name
}

# Instância Redis gerenciada com Customer Managed Key (CMK)
resource "azurerm_managed_redis" "mng_redis" {
  name                = var.redis_name
  resource_group_name = var.rg_name
  location            = var.location
  sku_name            = var.redis_sku

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.redis_identity.id]
  }

  customer_managed_key {
    key_vault_key_id          = var.key_vault_key_id
    user_assigned_identity_id = azurerm_user_assigned_identity.redis_identity.id
  }

  default_database {
    geo_replication_group_name = "myGeoGroup"
  }
}
