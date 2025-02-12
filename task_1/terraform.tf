terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.93.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-resgroup"
    storage_account_name = "tfstate40c1f81aa1f3"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}