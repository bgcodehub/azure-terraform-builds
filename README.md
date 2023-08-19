# Technical Project: Infrastructure as Code with Terraform

This repository showcases a series of Terraform scripts developed to provision cloud infrastructure across multiple levels of complexity. The project demonstrates my skills in building and orchestrating cloud resources with Terraform.

## Levels of Completion

The technical project has been broken down into several levels, each with increasing complexity:

- **Level 1**: Terraform code to create a Virtual Machine (VM) and a storage account/disk.
- **Level 2**: Terraform code to establish an Azure Kubernetes Service (AKS) cluster.
- **Level 3**: Terraform script to set up an AKS cluster alongside a SQL server. The AKS cluster is configured to connect to the SQL server, and there is a web-accessible "Hello World" application.
- **Level 4**: Terraform code to instantiate a private AKS cluster with SQL and Ingress. A web-accessible "Hello World" app is also deployed, storing the visiting IPs in the SQL database.

Each level has its own directory in this repository, and individual README files are provided for further details on each level's implementation.

## Cloud Provider

Though there are no restrictions on the cloud provider, the code examples provided utilize [Azure](https://azure.microsoft.com/). However, similar principles can be applied to other cloud providers like AWS, GCP, or Oracle.

## How to Use

1. Clone this repository to your local machine.
2. Navigate to the respective level directory you're interested in.
3. Follow the instructions in the specific `README.md` file for that level.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- Cloud provider CLI tools (for this example, [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)).
- Necessary cloud provider account and credentials set up.

