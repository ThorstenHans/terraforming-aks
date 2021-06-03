resource "azurerm_container_registry" "acr" {
  name                = "aksofficehours2021"
  resource_group_name = var.rg_name
  location            = var.location

  sku           = var.premium ? "Premium" : "Standard"
  admin_enabled = false

  tags = var.tags
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}

variable "premium" {
  type = bool
  default = false
}

variable "rg_name" {
  type = string
}
variable "tags" {
  type = map
  default = {}
}


variable "location" {
  type    = string
  default = "germanywestcentral"
  validation {
    condition     = contains(["eastus2", "germanywestcentral", "westeurope"], var.location)
    error_message = "Please use one of the following regions (germanywestcentral|eastus2|westeurope)."
  }
  description = "Default location for all Azure resources"
}
