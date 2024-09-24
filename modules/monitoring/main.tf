resource "azurerm_monitor_diagnostic_setting" "this" {
  name               = "aks-monitoring-diagnostic"  # Add a name here
  target_resource_id = var.target_resource_id

  log_analytics_workspace_id = var.workspace_id

  log {
  category = "kube-apiserver"  # Change to appropriate category
    enabled  = true
  }
  

  metric {
    category = "AllMetrics"  # Example metrics category
    retention_policy {
      enabled = false
      days    = 0
    }
  }
}
