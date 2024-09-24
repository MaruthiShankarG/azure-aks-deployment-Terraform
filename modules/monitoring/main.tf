resource "azurerm_monitor_diagnostic_setting" "this" {
  name               = "example-diagnostic-setting"
  target_resource_id = var.target_resource_id

  log {
    category = "kube-apiserver"
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    retention_policy {
      enabled = false
      days    = 0
    }
  }

  # Assuming you're sending diagnostics to a Log Analytics Workspace
  log_analytics_workspace_id = var.workspace_id
}
