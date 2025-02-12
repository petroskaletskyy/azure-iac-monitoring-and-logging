output "storage_account_name" {
  value = azurerm_storage_account.state_sa.name
}

output "storage_account_key" {
  value     = azurerm_storage_account.state_sa.primary_access_key
  sensitive = true
}