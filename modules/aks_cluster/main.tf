resource "azurerm_kubernetes_cluster" "this" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.aks_dns_prefix

  agent_pool_profile {
    name   = "default"
    count  = var.aks_agent_count
    vm_size = var.aks_vm_size
    os_type = "Linux"
  }

  identity { type = "SystemAssigned" }
}

resource "azurerm_role_assignment" "aks_role_assignment" {
  principal_id   = var.user_object_id
  role_definition_name = "Azure Kubernetes Service Cluster Admin"
  scope          = azurerm_kubernetes_cluster.this.id
}

