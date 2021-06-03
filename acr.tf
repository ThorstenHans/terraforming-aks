resource "azurerm_container_registry" "acr" {
  name                = "thns-${random_integer.env.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  sku           = var.acr_sku
  admin_enabled = var.acr_admin_enabled

  tags = local.tags
}
