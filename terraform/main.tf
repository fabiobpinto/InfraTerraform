module "rg" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
  tags = var.tags
}

module "network" {
  source             = "./modules/virtual_network"
  rg_name            = module.rg.rg_name
  location           = module.rg.location
  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space
  subnets            = var.subnets
  tags               = var.tags
}