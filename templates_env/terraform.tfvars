# !/bin/bash
# CSI Installation – Variables Declaration
# Version : May 27, 2024
# Author : mariefdu45@gmail.com
#
# Variables for resource group
rgName          = "resource group name, the one you like"
location        = "One of the Azure region"

# Variables for network and subnet²
networkName     = "Network group name, the one you like"
logicalNetworkAddresses = ["A.B.C.D/CIDR"]
subnetName      = "Subnet name, the one you like. Subnet is included in Network"
logicalSubnetAddresses = ""A.B.C.D/CIDR"

# Variables for AKS cluster
rgTag_environnement = "resource tag fro environment, the one you like"
ClusterName     = "Cluster name, the one you like"
ClusterVersion  = "Cluster Version, must be supported by AKS"
# All members of clusterrolebindingGroup will have all capabilities for this cluster
clusterrolebindingGroup = ["********-****-****-****-************"]
PoolName        ="Worker Pool name, the one you like"
NodeCount       = "The number of nodes you want in the cluster"
NodeSizeCompute = "One of the supported node type/size"
NsodeSizeDisk    = "Disk Node Size in GB"
# This certificate for accessing nodes
ssh_public_key  = "Where the public certificate for accessing nodes is on your computer"

