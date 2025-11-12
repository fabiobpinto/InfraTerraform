variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  description = "Location of the Redis instance"
}
variable "key_vault_name" {
  type        = string
  description = "Name of the Key Vault"
}