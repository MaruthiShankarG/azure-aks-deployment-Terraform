variable "name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The Azure location for the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "agent_count" {
  description = "Number of agents in the AKS cluster"
  type        = number
}

variable "vm_size" {
  description = "VM size for the AKS agents"
  type        = string
}
