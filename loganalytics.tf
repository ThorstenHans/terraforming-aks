resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-aks-office-hours-${terraform.workspace}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = var.log_analytics_workspace_sku

  retention_in_days = var.log_analytivcs_workspace_retention_in_days

  tags = local.tags
}
