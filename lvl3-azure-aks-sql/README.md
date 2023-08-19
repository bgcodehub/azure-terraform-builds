# Level 3: Azure Kubernetes Service (AKS) and SQL Database Integration with Terraform

In Level 3, I aimed to seamlessly integrate Azure Kubernetes Service (AKS) with Azure SQL Database to establish a robust, scalable infrastructure.

Below is the outline of my progress and approach:

### Progress:

## Infrastructure Breakdown

### 1. **Azure Provider Configuration**
- **Purpose**: Configure Terraform's integration with Azure and Kubernetes.
- **Key Features**: 
  - `provider "azurerm"`: Establishes Azure-specific configurations.
  - `provider "kubernetes"`: Allows Terraform to manage Kubernetes resources, pointing to the specific AKS cluster context.

### 2. **Resource Group & Service Principal**
- **Purpose**: Create a logical container for Azure resources and ensure that AKS has the necessary permissions to manage Azure resources.
- **Key Configuration**:
  - Resource Group Name: Defined using `var.rgname`
  - Service Principal: Established using the custom module "ServicePrincipal".

### 3. **Key Vault, Role Assignment & Secret Management**
- **Purpose**: To bolster security by managing sensitive data and permissions.
- **Key Configuration**: 
  - Role definition as "Contributor".
  - Storage of the Service Principal's credentials securely within the Azure Key Vault.

### 4. **Azure Kubernetes Service (AKS) Deployment**
- **Purpose**: Deploy and manage a scalable Kubernetes cluster within Azure.
- **Key Configuration**: 
  - Service Principal details for AKS authentication and integration.
  - Region and resource group details specified.

### 5. **Azure SQL Configuration**
- **Purpose**: Deploy a scalable and managed SQL server and database within Azure.
- **Achievements**: Successfully launched the SQL Server and its associated database. 
- **Key Configuration**: 
  - SQL server name, region, resource group, and admin login details.
  - Defined the database name using `var.sql_database_name`.

### 6. **Kubernetes SQL Credentials & Application Deployment**
- **Purpose**: Facilitate secure connectivity between applications within the AKS cluster and the SQL database.
- **Achievements**: 
  - I designed a simple Nginx 'Hello World' application and pushed its Docker image to my Docker Hub repository.
  - Created `deployment.yaml` and `service.yaml` for Kubernetes and successfully deployed the application onto the AKS cluster, making it accessible via a web browser.
- **Key Configuration**: 
  - Stored SQL credentials securely within a Kubernetes secret to facilitate secure database connections.

## Reflection & Way Forward

Integrating AKS with Azure SQL using Terraform has posed intricate challenges, and I am actively working on perfecting the solution. While I made substantial progress, including successfully deploying an SQL database and deploying an application onto AKS, I faced hurdles when attempting direct connectivity between the AKS cluster and SQL database.

In line with best practices, I always prioritize security and scalability, using tools like Azure Key Vault for sensitive data management and ensuring modular design for easy scalability and maintenance.

As I continue to refine this project, my next objective is to establish a seamless connection between the AKS cluster and the SQL database, ensuring both robustness and security.

I'm confident that with further investigation and iteration, I will achieve a holistic solution.
