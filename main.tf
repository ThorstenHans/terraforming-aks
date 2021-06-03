resource "azurerm_resource_group" "rg" {
  name     = "rg-espc-online"
  location = var.location

  tags = local.tags
}


resource "random_integer" "env" {
  min = 1000
  max = 9999
}
