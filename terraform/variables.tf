variable "subscription_id" {
  type = string
}

variable "rg_name" {
  type        = string
  description = "RG name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

### Key Vault Variables
# variable "key_vault_name" {
#   type        = string
#   description = "Name of the Key Vault"
# }



### Redis Variables
variable "mgmt_redis" {
  type = map(object({
    redis_name                  = string
    redis_sku                   = string
    redis_private_endpoint_name = string
    redis_private_ip_address    = string
  }))
}

# variable "redis_name" {
#   type        = string
#   description = "Redis instance name"
# }

# variable "redis_sku" {
#   type        = string
#   description = "SKU of the Redis instance"
# }

# variable "redis_private_endpoint_name" {
#   type        = string
#   description = "Private endpoint name of the Redis instance"
# }
# variable "redis_private_ip_address" {
#   type        = string
#   description = "Private IP address of the Redis instance"
# }

variable "subnet_redis" {
  description = "Nome da subnet existente"
  type        = string
}
variable "vnet_name_redis" {
  description = "Nome da Virtual Network existente"
  type        = string
}