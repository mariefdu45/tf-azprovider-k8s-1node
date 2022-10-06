# Variables pour la création du resource group
rgName          = "rg1"
location        = "North Europe"

# Variables pour la création du réseau
networkName     = "aks-network"
logicalNetworkAddresses = ["10.99.0.0/16"]
subnetName      = "node-network"
logicalSubnetAddresses = "10.99.99.0/24"

# Variables pour la création du cluster AKS
rgTag_environnement = "Labs-MF"
ClusterName     = "k8s-rg1-lab1"
ClusterVersion  = "1.23.8"
clusterrolebindingGroup = ["Groupe ayant droit à cluster-admin"]
PoolName        ="agentpool"
NodeCount       = "1"
NodeSizeCompute = "standard_b2s"
NodeSizeDisk    = "30"
ssh_public_key  = "~/.ssh/id_rsa.pub"

