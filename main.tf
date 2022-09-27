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

resource "azurerm_virtual_network" "vnet" {
  name                = var.networkName
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.logicalNetworkAddresses
#  dns_servers         = ["10.99.0.4", "10.99.0.5"]


  subnet {
    name             = var.subnetName
    address_prefix   = var.logicalSubnetAddresses
#    security_group = azurerm_network_security_group.rg.id
  }

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
    vnet_subnet_id  = azurerm_virtual_network.vnet.subnet.*.id[0]
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  azure_active_directory_role_based_access_control {
    managed                 = true
    admin_group_object_ids  = var.clusterrolebindingGroup
  }
  
  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  
}
/*output "kube_config_admin" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_admin_config_raw}"
  sensitive = true
}*/

