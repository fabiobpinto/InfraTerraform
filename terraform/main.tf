terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.45.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

resource "random_string" "name" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "rg_name" {
  name     = "rg-${random_string.name.result}"
  location = "East US"
}
