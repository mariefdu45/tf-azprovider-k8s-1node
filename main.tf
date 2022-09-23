provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = var.rgName
  location = var.location

  tags = {
    environment = var.rgTag_environnement
  }
}


resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.ClusterName
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.ClusterName
  kubernetes_version  = var.ClusterVersion

  default_node_pool {
    name            = var.PoolName
    node_count      = var.NodeCount
    vm_size         = var.NodeSizeCompute
    os_disk_size_gb = var.NodeSizeDisk
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  azure_active_directory_role_based_access_control {
    managed                 = true
    admin_group_object_ids  = var.clusterrolebindingGroup
  }

}
/*output "kube_config_admin" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_admin_config_raw}"
  sensitive = true
}*/

