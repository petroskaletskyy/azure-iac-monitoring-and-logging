terraform {
  backend "azurerm" {
    resource_group_name  = "storage-account-rg"
    storage_account_name = "terraformstatesak5fif4"
    container_name       = "terraform-state-3"
    key                  = "terraform.tfstate"
  }
}