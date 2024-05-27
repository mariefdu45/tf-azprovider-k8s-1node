# !/bin/bash
# CSI Installation – Variables Declaration
# Version : May 27, 2024
# Author : mariefdu45@gmail.com
#

# Resource group creation
resource "azurerm_resource_group" "rg" {
  name     = var.rgName
  location = var.location

  tags = {
    environment = var.rgTag_environnement
  }
}

# Network and subnet  Creation
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

# Cluster Creation
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

  identity {
    type = "SystemAssigned"
  }


  azure_active_directory_role_based_access_control {
    managed                 = true    
    azure_rbac_enabled     = true
    admin_group_object_ids  = var.clusterrolebindingGroup
  }
  
  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }
}
