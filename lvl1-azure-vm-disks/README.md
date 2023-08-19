# Level 1: Creating a VM and Storage with Terraform on Azure

In this Level 1 project, I utilize Terraform to automate the creation of a Virtual Machine (VM) and its associated storage infrastructure on Azure. Here's a step-by-step walkthrough of the code and the design decisions that went into crafting this infrastructure.

## 1. **Resource Group - `azurerm_resource_group`**
**Purpose**: Every Azure resource is part of a resource group, a logical container for Azure resources. This ensures better management and organization of resources.

- **name**: Formed using a variable prefix, providing a consistent naming pattern for all resources. Handy when distinguishing resources for different projects or environments (like dev, staging, prod).
- **location**: Utilizing a variable allows for deployment in various Azure regions without adjusting the main script.

## 2. **Virtual Network - `azurerm_virtual_network`**
**Purpose**: Virtual networks allow Azure resources to communicate securely with each other, the internet, and on-premises networks.

- **address_space**: This is the CIDR notation for the virtual network, chosen with a /16 range for scalability.

## 3. **Subnet - `azurerm_subnet`**
**Purpose**: Subnets let you partition the virtual network into multiple sub-networks and allocate a portion of the virtual network's address space to each subnet.

- **address_prefixes**: A /24 CIDR range ensures a balance between the number of hosts and subnets.

## 4. **Network Interface - `azurerm_network_interface`**
**Purpose**: The network interface enables the VM to communicate with the virtual network.

- **ip_configuration**: Dynamic IP allocation ensures the VM receives an IP without manual intervention.

## 5. **Virtual Machine - `azurerm_virtual_machine`**
**Purpose**: The VM, the main component of our project.

- **vm_size**: "Standard_F2" strikes a balance between computational power and cost.
- **delete_os_disk_on_termination**: When the VM is deleted, its associated OS disk is also removed, preventing orphaned resources and unnecessary expenses.

## 6. **Data Disk Attachment - `azurerm_virtual_machine_data_disk_attachment`**
**Purpose**: To enhance the VM's storage capacity, we're attaching external managed disks.

- **lun**: Logical Unit Number helps in uniquely identifying each disk.
- **count**: We're provisioning 10 data disks for scalability and redundancy.

## 7. **Managed Disk - `azurerm_managed_disk`**
**Purpose**: Azure Managed Disks are block-level storage volumes managed by Azure and paired with Azure Virtual Machines.

- **disk_size_gb**: Each disk has a size of 10GB, balancing between storage requirements and cost.
- **create_option**: "Empty" ensures we're spawning a blank disk.

## Thought Process and Design Decisions:
- **Scalability**: Resources, such as the virtual network and managed disks, are designed for future scalability.
- **Consistency**: Utilizing the `prefix` variable guarantees uniform naming across all resources.
- **Cost-Efficiency**: Parameters like `Standard_F2` for VM size and `Standard_LRS` for disk type ensure the infrastructure remains cost-effective.
- **Modularity**: Segmenting the infrastructure into modular parts means each resource can be managed, scaled, or modified independently.
