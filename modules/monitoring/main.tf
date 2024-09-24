resource "azurerm_monitor_diagnostic_setting" "this" {
  name               = "aks-monitoring-diagnostic"  # Add a name here
  target_resource_id = var.target_resource_id

  log_analytics_workspace_id = var.workspace_id

  log {
    category = "kube-apiserver"
    enabled  = true
    retention_policy {
      enabled = false  # Use this if you need to set a retention policy
    }
  }

  metric {
    category = "AllMetrics"  # Example metrics category
    retention_policy {
      enabled = false
      days    = 0
    }
  }
}
