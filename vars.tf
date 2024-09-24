variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where resources will be deployed"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "aks_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "aks_dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}

variable "aks_agent_count" {
  description = "The number of agents in the AKS cluster"
  type        = number
}

variable "aks_vm_size" {
  description = "The size of the AKS VM"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the log analytics workspace"
  type        = string
}

variable "user_object_id" {
  description = "The Object ID of the user to assign the role to"
  type        = string
}
