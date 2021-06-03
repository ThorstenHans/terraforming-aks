resource "azurerm_user_assigned_identity" "aks" {
  name                = "identity-aks-${terraform.workspace}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  tags = local.tags
}
