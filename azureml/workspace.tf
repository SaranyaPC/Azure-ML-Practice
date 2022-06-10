# Dependent resources for Azure Machine Learning
resource "azurerm_application_insights" "default" {
  name                = "appiml${var.prefix}"
  location            = var.location
  resource_group_name =  var.resource_group_name
  application_type    = "web"
}

resource "azurerm_key_vault" "default" {
  name                     = "key${var.prefix}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "premium"
  purge_protection_enabled = false
}

resource "azurerm_storage_account" "default" {
  name                     = "storage3${var.prefix}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_container_registry" "default" {
  name                = "cr${var.prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Premium"
  admin_enabled       = true
}

# Machine Learning workspace
resource "azurerm_machine_learning_workspace" "default" {
  name                    = "ml${var.prefix}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  application_insights_id = azurerm_application_insights.default.id
  key_vault_id            = azurerm_key_vault.default.id
  storage_account_id      = azurerm_storage_account.default.id
  container_registry_id   = azurerm_container_registry.default.id

  identity {
    type = "SystemAssigned"
  }
}