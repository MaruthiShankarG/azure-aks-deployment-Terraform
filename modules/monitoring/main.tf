resource "azurerm_monitor_diagnostic_setting" "this" {
  name               = var.name
  target_resource_id = var.target_resource_id

  log_analytics_destination_type = "Dedicated"
  workspace_id                   = var.workspace_id

  log {
    category = "kube-apiserver"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
