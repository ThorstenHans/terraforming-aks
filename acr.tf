module "myacr" {
  source = "./components/acr"

  premium  = false
  rg_name  = azurerm_resource_group.rg.name
  tags     = local.tags
  location = var.location


}
