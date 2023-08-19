variable "server_name" {
  description = "The name of the SQL server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the SQL server will be created."
  type        = string
}

variable "location" {
  description = "The Azure Region where the SQL server should be created."
  type        = string
}

variable "sql_version" {
  description = "The version for the SQL server. Typically `12.0` for Azure SQL."
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "The name of the administrative user for the SQL server."
  type        = string
}

variable "administrator_login_password" {
  description = "The password for the administrative user."
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "The name of the SQL database."
  type        = string
}
