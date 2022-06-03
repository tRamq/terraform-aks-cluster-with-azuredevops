terraform {   # Terraform 
  backend "azurerm" {   #Stores the state as a Blob with the given key within the Container at Azure Storage 
 
    resource_group_name  = "tf_rg"
 
    storage_account_name = "terraformstorageaccount2"
 
    container_name       = "tfstate"
 
    key                  = "terraform.tfstate"

  }
}

# This will create a resource group to hold Azure resources 
resource "azurerm_resource_group" "aks-rg" {

  name     = var.resource_group_name

  location = var.location

}


# Creating Managed Kubernetes Cluster 
resource "azurerm_kubernetes_cluster" "aks" {

  name                = var.cluster_name

  kubernetes_version  = var.kubernetes_version

  location            = var.location

  resource_group_name = azurerm_resource_group.aks-rg.name

  dns_prefix          = var.cluster_name



  http_application_routing_enabled = true


   # In AKS Nodes of the same configuration are grouped into node pools.
  default_node_pool {

    name                = "system"

    node_count          = var.system_node_count

    vm_size             = "Standard_D2as_v5"  # 2 vCPu and 8GiB ram 

    type                = "VirtualMachineScaleSets"

    zones               = [1] #Availability Zones, You can specify multiple for Highly Available Systems

    enable_auto_scaling = false # It allows you adding more resources to your system within dynamic load. 

  }



  identity {

    type = "SystemAssigned"  #It will determine who will manage the cluster . You can use either use user assigned managed identities or service principals

  }



  network_profile {

    load_balancer_sku = "standard"


    # Azure Container Networking Interface(CNI) , Every pod gets an IP address from the Virtual Network
    # And it can be accessible from virtual Network
    network_plugin    = "azure"


  }

}

