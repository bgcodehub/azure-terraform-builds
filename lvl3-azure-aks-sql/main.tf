# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "bg-aks-cluster"
}


# Create a resource group
resource "azurerm_resource_group" "rg1" {
  name     = var.rgname
  location = var.location
}

module "ServicePrincipal" {
  source                 = "./modules/ServicePrincipal"
  service_principal_name = var.service_principal_name

  depends_on = [azurerm_resource_group.rg1]
}

resource "azurerm_role_assignment" "rolespn" {

  scope                = "/subscriptions/${var.subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = module.ServicePrincipal.service_principal_object_id

  depends_on = [
    module.ServicePrincipal
  ]
}

module "keyvault" {
  source                      = "./modules/keyvault"
  keyvault_name               = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.rgname
  service_principal_name      = var.service_principal_name
  service_principal_object_id = module.ServicePrincipal.service_principal_object_id
  service_principal_tenant_id = module.ServicePrincipal.service_principal_tenant_id

  depends_on = [
    module.ServicePrincipal
  ]
}

resource "azurerm_key_vault_secret" "example" {
  name         = module.ServicePrincipal.client_id
  value        = module.ServicePrincipal.client_secret
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [
    module.keyvault
  ]
}

# Create Azure Kubernetes Service
module "aks" {
  source                 = "./modules/aks/"
  service_principal_name = var.service_principal_name
  client_id              = module.ServicePrincipal.client_id
  client_secret          = module.ServicePrincipal.client_secret
  location               = var.location
  resource_group_name    = var.rgname

  depends_on = [
    module.ServicePrincipal
  ]
}

# SQL Server and DB Configuration
module "sql" {
  source                       = "./modules/sql"
  server_name                  = var.sql_server_name
  resource_group_name          = var.rgname
  location                     = var.location
  administrator_login          = var.sql_administrator_login
  administrator_login_password = var.sql_administrator_login_password
  database_name                = var.sql_database_name
}

resource "kubernetes_secret" "sql_credentials" {
  metadata {
    name = "sql-credentials"
  }

  data = {
    username = var.sql_username
    password = var.sql_password
  }

  type = "Opaque"
}
