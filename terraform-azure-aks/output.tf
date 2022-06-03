# This values allow you to export structured data about resources you created

output "aks_id" {

  value = azurerm_kubernetes_cluster.aks.id

}



output "aks_fqdn" {

  value = azurerm_kubernetes_cluster.aks.fqdn

}



output "aks_node_rg" {

  value = azurerm_kubernetes_cluster.aks.node_resource_group

}


# it will export kubeconfig file . This information is needed to connect to the Kubernetes cluster.
resource "local_file" "kubeconfig" {

  depends_on = [azurerm_kubernetes_cluster.aks]

  filename   = "config"

  content    = azurerm_kubernetes_cluster.aks.kube_config_raw

}