output "public_ip" {
  value = data.azurerm_public_ip.public_ip.ip_address
}

output "ssh_command" {
  value = "ssh -i vm_ssh_key ${var.username}@${data.azurerm_public_ip.public_ip.ip_address}"
}