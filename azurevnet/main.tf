# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.76.0"
}

# Create virtual network
resource "azurerm_virtual_network" "aml" {
  name                = "vnet-${var.prefix}"
  address_space       = ["10.100.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Create subnet
resource "azurerm_subnet" "acr" {
  name                 = "acr-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aml.name
  address_prefix       = "10.100.1.0/24"
}

# Create subnet
resource "azurerm_subnet" "devops" {
  name                 = "devops-agents-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aml.name
  address_prefix       = "10.100.2.0/24"
}
