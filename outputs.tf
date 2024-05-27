# !/bin/bash
# CSI Installation – Variables Declaration
# Version : May 27, 2024
# Author : mariefdu45@gmail.com
#

# Display resource group variables
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Display network variables
output "SUBNET_ID" {
  value = azurerm_virtual_network.vnet.id
}

# Display cluster variables
output "kube_config_admin" {
  #value = "${azurerm_kubernetes_cluster.cluster.kube_admin_config_raw}"
  value = azurerm_kubernetes_cluster.cluster.kube_admin_config_raw
  sensitive = true
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.cluster.name
  sensitive = true
}

output "host" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.host
  sensitive = true
}

output "client_key" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.client_key
  sensitive = true
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.cluster.kube_config_raw
  sensitive = true
}

output "cluster_username" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.username
  sensitive = true
}

output "cluster_password" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.password
  sensitive = true
}

