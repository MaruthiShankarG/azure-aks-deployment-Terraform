terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "./modules/resource_group"
  name    = var.rg_name
  location = var.location
}

module "virtual_network" {
  source              = "./modules/virtual_network"
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "aks_cluster" {
  source              = "./modules/aks_cluster"
  name                = var.aks_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  dns_prefix          = var.aks_dns_prefix
  agent_count         = var.aks_agent_count
  vm_size             = var.aks_vm_size
  user_object_id      = var.user_object_id  # Add this line
}

module "network_security_group" {
  source              = "./modules/network_security_group"
  name                = var.nsg_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "monitoring" {
  source              = "./modules/monitoring"
 
  target_resource_id  = module.aks_cluster.id
  workspace_id        = var.log_analytics_workspace_id
}
