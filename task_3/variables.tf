variable "location" {
  type    = string
  default = "West Europe"
}

variable "resource_group_name" {
  type    = string
  default = "scalable-infra-rg"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "tfstate_resource_group_name" {
  type    = string
  default = "storage-account-rg"
}

variable "tfstate_storage_account_name" {
  type    = string
  default = "terraformstatesak5fif4"
}