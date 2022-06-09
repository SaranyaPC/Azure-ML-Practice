# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=3.0.0"
}


# ACR
resource "azurerm_container_registry" "acr" {
  name                = "acrml${var.prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Premium"
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "westeurope"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}
