provider "azurerm" {
  features {}
}

resource "random_id" "suffix" {
  byte_length = 6
}

resource "azurerm_resource_group" "state_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "state_sa" {
  name                     = "${var.storage_account_name}${random_id.suffix.hex}"
  resource_group_name      = azurerm_resource_group.state_rg.name
  location                 = azurerm_resource_group.state_rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  blob_properties {
    container_delete_retention_policy {
      days = 7
    }
  }
}

resource "azurerm_storage_container" "state_container" {
  name                  = var.storage_container_name
  storage_account_id  = azurerm_storage_account.state_sa.id
  container_access_type = var.storage_container_access_type
}

