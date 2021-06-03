provider "random" {}

provider "azurerm" {
  features {}
}

terraform {

  required_version = "= 0.15.3"

  backend "azurerm" {
    resource_group_name  = "rg-aks-office-hrs-state-backend"
    storage_account_name = "saakshrs2021state"
    container_name       = "terraform-state"
    key                  = "aks_office_hours_2021.tfstate"
    use_azuread_auth     = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.61.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "= 3.1.0"
    }
  }
}
