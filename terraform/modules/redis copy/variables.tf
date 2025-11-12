variable "redis_name" {
  type        = string
  description = "Name of the Redis instance"
}
variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  description = "Location of the Redis instance"
}
variable "redis_sku" {
  type        = string
  default     = "Standard"
  description = "SKU of the Redis instance"
}

variable "key_vault_key_id" {
  type        = string
  description = "ID of the Key Vault Key for Customer Managed Keys"
}

# variable "user_assigned_identity_id" {
#   type        = string
#   description = "ID of the User Assigned Identity for accessing Key Vault"
# }