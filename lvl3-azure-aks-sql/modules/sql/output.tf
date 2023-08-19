output "sql_server_id" {
  description = "The ID of the SQL Server."
  value       = azurerm_mssql_server.example.id
}

output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL Server."
  value       = azurerm_mssql_server.example.fully_qualified_domain_name
}

output "sql_server_administrator_login" {
  description = "The administrator login name for the SQL Server."
  value       = azurerm_mssql_server.example.administrator_login
}

output "sql_database_id" {
  description = "The ID of the SQL Database."
  value       = azurerm_mssql_database.example.id
}

output "sql_database_collation" {
  description = "The collation of the SQL Database."
  value       = azurerm_mssql_database.example.collation
}
