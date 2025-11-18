resource "azurerm_managed_redis" "mng_redis" {
  name                = var.redis_name
  resource_group_name = var.rg_name
  location            = var.location
  sku_name            = var.redis_sku

  default_database {
#    geo_replication_group_name = "myGeoGroup"
  }
  timeouts {
    create = "60m"
    delete = "60m"
    update = "60m"
  }
}

data "azurerm_subnet" "redis_subnet" {
  name                 = var.subnet_redis
  virtual_network_name = var.vnet_name_redis
  resource_group_name  = var.rg_name
}

resource "azurerm_private_endpoint" "pep-redis" {
  name                = var.redis_private_endpoint_name
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = data.azurerm_subnet.redis_subnet.id
  private_service_connection {
    name                           = "psc-${var.redis_name}"
    private_connection_resource_id = azurerm_managed_redis.mng_redis.id
    is_manual_connection           = false
    subresource_names              = ["redisEnterprise"]
  }

  ip_configuration {
    name               = "ip-${var.redis_name}"
    private_ip_address = var.redis_private_ip_address
    subresource_name   = "redisEnterprise"
    member_name        = "redisEnterprise"
  }
}
