## Level 4: Private AKS Cluster with SQL and Ingress using Terraform

I aimed to employ Terraform in order to establish a private AKS cluster, paired with SQL for data storage and an Ingress for access management. Alongside these core components, a simple web-accessible "Hello World" application was planned, designed to record the IPs of its visitors within the SQL database. 

Below is the outline of my progress and approach:

### Progress:

1. **Establishing the Infrastructure with Azure Providers**: Set up the necessary Azure resources, specifically targeting AKS and its dependencies.
    ```hcl
    provider "azurerm" {
      features {}
    }
    ```

2. **Defining Virtual Networks**: Created two resource groups – one for the virtual network and another for the Kubernetes services. Additionally, laid out two separate virtual networks for hub and Kubernetes services. Peerings between these networks ensure connectivity.
    ```hcl
    resource "azurerm_resource_group" "vnet" {...}
    resource "azurerm_resource_group" "kube" {...}
    ```

3. **Network Configurations and Firewall**: Integrated Azure Firewall to manage and log the virtual network traffic. Additionally, a route table directs the traffic, ensuring secure and streamlined data flow.
    ```hcl
    module "hub_network" {...}
    module "kube_network" {...}
    module "vnet_peering" {...}
    module "firewall" {...}
    module "routetable" {...}
    ```

4. **Private AKS Deployment**: Utilized Azure's AKS service to deploy a private Kubernetes cluster. The configuration ensures the cluster operates within the defined virtual network and employs user-defined routing for outbound traffic.
    ```hcl
    resource "azurerm_kubernetes_cluster" "privateaks" {...}
    ```

5. **Jumpbox for Access**: Deployed a jumpbox within the hub network to ensure secure access to the private AKS.
    ```hcl
    module "jumpbox" {...}
    ```

### Web-Accessible Application:

I've crafted a simple Nginx "Hello World" application which I then containerized and stored in my Docker Hub repository. This image served as the foundation for the project. Using `deployment.yaml` and `service.yaml` files in the Kubernetes directory, I successfully deployed the application onto the AKS cluster, making it accessible via a browser.

### Current Challenges:

Integrating AKS with Azure SQL using Terraform has posed intricate challenges, and I am actively working on perfecting the solution. The key obstacle lies in ensuring seamless communication between the AKS cluster and the SQL database.

### Moving Forward:

I'm still working on smoothing out the connection between AKS and SQL.
