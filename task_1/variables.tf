variable "resource_group_name" {
  type = string
  default = "tfstate-resgroup"
}  

variable "resource_group_location" {
  type = string
  default = "North Europe"
}

variable "storage_account_name" {
  type = string
  default = "tfstate"
}

variable "storage_account_tier" {
  type = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type = string
  default = "LRS"
}

variable "storage_container_name" {
  type = string
  default = "tfstate"
}

variable "storage_container_access_type" {
  type = string
  default = "private"
}