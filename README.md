# terraform-aks-cluster-with-azuredevops


This Project automatically deploys infrastructure and Web-app to Kubernetes Service with using everthing as code principles.

Tech Stack:
* Python Flask Web Framework
* Terraform
* Azure Cloud Services
* Azure DevOps
* Kubernetes
* Docker

## Usage

 - Create an Azure Devops project 
 - Add repositories and pipelines
 - Add ARM Service Connection using the Azure Portal . You can follow this [Guideline](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
 - Add Service Connection with Dockerhub
 - Add [Self Hosted](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-linux?view=azure-devops)  agents to agent pool or use Microsoft hosted ones
 - Create pipelines with given yamls
 - Run the pipelines.
