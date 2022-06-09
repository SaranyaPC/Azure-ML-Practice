# Deploy a Resource Group with an Azure ML Workspace and supporting resources.

# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=3.0.0"
}

# Data

data "azurerm_client_config" "current" {}

# Resource Group

resource "azurerm_resource_group" "aml" {
  name     = "rg-${var.prefix}-ml"
  location = var.location
}


module "vnet" {
  source = "./azurevnet"
  resource_group_name = azurerm_resource_group.aml.name
  prefix = var.prefix
  location = var.location
}

module "acr" {
  source = "./azureacr"
  prefix = var.prefix
  location = var.location
  resource_group_name = azurerm_resource_group.aml.name
}

module "azureml" {
  source = "./azureml"
  prefix = var.prefix
  location = var.location
  tenant_id = data.azurerm_client_config.current.tenant_id
  resource_group_name = azurerm_resource_group.aml.name
}

