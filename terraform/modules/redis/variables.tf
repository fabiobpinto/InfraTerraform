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
variable "redis_name" {
  type        = string
  description = "Name of the Redis instance"
}

variable "redis_private_endpoint_name" {
  type        = string
  description = "Private endpoint name of the Redis instance"
}

variable "redis_private_ip_address" {
  type        = string
  description = "Private IP address of the Redis instance"
}


variable "subnet_redis" {
  description = "Nome da subnet existente"
  type        = string
}

variable "vnet_name_redis" {
  description = "Nome da Virtual Network existente"
  type        = string
}
