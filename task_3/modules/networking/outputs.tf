output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet1_id" {
  value = azurerm_subnet.subnet1.id
}

output "subnet2_id" {
    value = azurerm_subnet.subnet2.id
}