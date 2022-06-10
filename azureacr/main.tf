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
  name                = "acrml1${var.prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Premium"
  georeplications {
    location                = var.geolocation
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = var.geolocation1
    zone_redundancy_enabled = true
    tags                    = {}
  }
}
