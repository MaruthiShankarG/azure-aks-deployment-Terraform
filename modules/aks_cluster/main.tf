resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

 default_node_pool {
    name       = "default"
    node_count = var.agent_count
    vm_size    = var.vm_size
  }
  

  identity { type = "SystemAssigned" }
}


resource "azurerm_role_assignment" "aks_role_assignment" {
  principal_id   = var.user_object_id
  role_definition_name = "Azure Kubernetes Service Cluster Admin"
  scope          = azurerm_kubernetes_cluster.this.id
}

