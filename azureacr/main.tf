# Configure the Azure Provider
terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.76.0"
    }
  }
}

provider "azurerm" {
  features {}
}


# ACR

resource "azurerm_container_registry" "acr" {
  name                = "acrml2${var.prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Premium"
  admin_enabled       = true
}
