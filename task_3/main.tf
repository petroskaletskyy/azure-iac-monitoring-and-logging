provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source              = "./modules/networking"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_resource_group.rg]
}

module "compute" {
  source              = "./modules/compute"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  admin_username      = var.admin_username
  subnet_id           = module.networking.subnet1_id
  depends_on          = [azurerm_resource_group.rg]
}

module "security" {
  source              = "./modules/security"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_resource_group.rg]
}

resource "azurerm_role_assignment" "storage_blob_contributor" {
  scope                = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.tfstate_resource_group_name}/providers/Microsoft.Storage/storageAccounts/${var.tfstate_storage_account_name}"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

data "azurerm_client_config" "current" {}