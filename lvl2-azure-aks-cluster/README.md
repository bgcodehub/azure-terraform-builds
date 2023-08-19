# Level 2: Creating an Azure Kubernetes Service with Terraform on Azure

In Level 2, I aimed to automate the provisioning of an Azure Kubernetes Service (AKS). The approach is enriched with Service Principals and Azure Key Vault for more secure and scalable deployment. Let's delve into the architecture and design decisions.

## 1. **Azure Provider Configuration - `provider "azurerm"`**
**Purpose**: This initializes the Azure provider for Terraform, a prerequisite to communicate and manage resources on Azure.

- **features**: A placeholder for future configurations.

## 2. **Resource Group - `azurerm_resource_group`**
**Purpose**: This is a container that holds related resources for an Azure solution.

- **name** and **location**: Defined using variables for flexibility.

## 3. **Service Principal Module - `module "ServicePrincipal"`**
**Purpose**: Service Principals are used for non-human app-to-app interactions. They are essential for granting specific permissions to AKS for managing Azure resources.

- **service_principal_name**: Defined by a variable.
- **depends_on**: Ensures the resource group is created before the Service Principal.

## 4. **Role Assignment - `azurerm_role_assignment`**
**Purpose**: Assigns the required permissions to the Service Principal.

- **scope** and **role_definition_name**: Defines the scope of permissions (at the subscription level) and the role type.
- **principal_id**: References the Service Principal's object ID.

## 5. **Key Vault Module - `module "keyvault"`**
**Purpose**: Azure Key Vault is a tool for securely storing and accessing secrets.

- **keyvault_name**, **location**, **resource_group_name**: Configuration details for the Key Vault.
- **service_principal_name**, **service_principal_object_id**, **service_principal_tenant_id**: Details about the Service Principal, ensuring secure access.

## 6. **Key Vault Secret - `azurerm_key_vault_secret`**
**Purpose**: Storing the Service Principal's secrets securely.

- **name** and **value**: The Service Principal's client ID and secret.
- **key_vault_id**: Reference to the created Key Vault.

## 7. **Azure Kubernetes Service Module - `module "aks"`**
**Purpose**: The heart of this level - creating the Azure Kubernetes Service.

- **service_principal_name**: The name of the Service Principal for AKS.
- **client_id** and **client_secret**: Credentials for AKS to access other Azure services.
- **location** and **resource_group_name**: Location and resource group details.

## Design Decisions and Thought Process:
- **Scalability**: Modular approach using Terraform modules for scalability and reusability.
- **Security**: Leveraging Azure Key Vault for securely storing secrets and Service Principal for controlled permissions.
- **Simplicity**: By utilizing Terraform's `depends_on`, we ensure resources are created in the necessary order.
- **Flexibility**: Making heavy use of variables (`var`) for configurability without code changes.

The Terraform script designed for Level 2 is both secure and scalable, laying the foundation for a robust AKS setup in Azure.
