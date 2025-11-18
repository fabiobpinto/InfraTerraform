terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
}

module "rg" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}

# module "key_vault" {
#   source         = "./modules/key_vault"
#   rg_name        = var.rg_name
#   location       = var.location
#   key_vault_name = var.key_vault_name
# }

# module "redis" {
#   source                      = "./modules/redis"
#   rg_name                     = module.rg.rg_name
#   location                    = module.rg.rg_location
#   redis_name                  = var.mgmt_redis.mgm-redis-01.redis_name
#   redis_sku                   = var.mgmt_redis.mgm-redis-01.redis_sku
#   subnet_redis                = var.subnet_redis
#   vnet_name_redis             = var.vnet_name_redis
#   redis_private_endpoint_name = var.mgmt_redis.mgm-redis-01.redis_private_endpoint_name
#   redis_private_ip_address    = var.mgmt_redis.mgm-redis-01.redis_private_ip_address
# }


module "redis" {
  source                      = "./modules/redis"
  for_each                    = var.mgmt_redis
  rg_name                     = module.rg.rg_name
  location                    = module.rg.rg_location
  redis_name                  = each.value.redis_name
  redis_sku                   = each.value.redis_sku
  subnet_redis                = var.subnet_redis
  vnet_name_redis             = var.vnet_name_redis
  redis_private_endpoint_name = each.value.redis_private_endpoint_name
  redis_private_ip_address    = each.value.redis_private_ip_address
}