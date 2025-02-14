resource "azurerm_network_security_group" "nsg" {
  name = "scalable-nsg"
  resource_group_name = var.resource_group_name
  location = var.location

  security_rule {
    name = "allow_http"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}