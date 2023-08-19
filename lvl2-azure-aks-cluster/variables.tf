variable "rgname" {
  type        = string
  description = "resource group name"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "service_principal_name" {
  type = string
}

variable "keyvault_name" {
  type = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

