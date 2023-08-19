resource "azurerm_mssql_server" "example" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_database" "example" {
  name      = var.database_name
  server_id = azurerm_mssql_server.example.id
}

resource "azurerm_mssql_firewall_rule" "example" {
  name             = "allow_aks"
  server_id        = azurerm_mssql_server.example.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255" # Caution: This allows access from any IP. For demo only.
}




