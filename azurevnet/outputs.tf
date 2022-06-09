output "acr_subnet_name" {
  value = azurerm_subnet.acr.name
}

output "acr_subnet_id" {
  value = azurerm_subnet.acr.id
}

output "devops_subnet_id" {
  value = azurerm_subnet.devops.id
}
