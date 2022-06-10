# Deploy a Resource Group with an Azure ML Workspace and supporting resources.

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
  resource_group_name = azurerm_resource_group.aml.name
  prefix = var.prefix
  location = var.location
}

module "azureml" {
  source = "./azureml"
  resource_group_name = azurerm_resource_group.aml.name
  prefix = var.prefix
  location = var.location
  tenant_id = data.azurerm_client_config.current.tenant_id
}

