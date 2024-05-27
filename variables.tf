
# !/bin/bash
# CSI Installation – Variables Declaration
# Version : May 27, 2024
# Author : mariefdu45@gmail.com
#
# Variables for Resource group creation
variable "rgName" {
  description = "Resource Group Name"
}

variable "location" {
  description = "Resource Group Location"
}

variable "rgTag_environnement" {
  description = "Tag environnement"
}

# Variables for Network creation
variable "networkName" {
  description = "Vnet name"
}
variable "logicalNetworkAddresses" {
  description = "Vnet adresses"
}

variable "subnetName" {
  description = "Subnet Name"
}

variable "logicalSubnetAddresses" {
  description = "Subnet addresses"
}


# Variables for AKS cluster creation
variable "ClusterName" {
  description = "Cluster name"
}

variable "ClusterVersion" {
  description = "Cluster Version"
}

variable "clusterrolebindingGroup" {
  type = list
  description = "All members of clusterrolebindingGroup will have all capabilities for this cluster"
}

variable "PoolName" {
  description = "nodes pool name"
}

variable "NodeCount" {
  description = "nodes count"
}

variable "NodeSizeCompute" {
  description = "nodes size"
}

variable "NodeSizeDisk" {
  description = "disk nodes size"
}


variable "ssh_public_key" {
  description = "This certificate for accessing nodes"
}

