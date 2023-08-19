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

# Variables related to SQL module
variable "sql_server_name" {
  type        = string
  description = "Name of the Azure SQL Server"
}

variable "sql_administrator_login" {
  type        = string
  description = "Administrator login name for Azure SQL Server"
}

variable "sql_administrator_login_password" {
  type        = string
  description = "Administrator login password for Azure SQL Server"
}

variable "sql_database_name" {
  type        = string
  description = "Name of the Azure SQL Database"
}

variable "sql_username" {
  description = "The SQL server username"
  type        = string
}

variable "sql_password" {
  description = "The SQL server password"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

