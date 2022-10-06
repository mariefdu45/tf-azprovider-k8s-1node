
# Variables pour la création du resource group
variable "rgName" {
  description = "Nom du resource Group"
}

variable "location" {
  description = "Emplacement des ressources"
}

variable "rgTag_environnement" {
  description = "Tag environnement"
}

# Variables pour la création du réseau
variable "networkName" {
  description = "Nom du vnet"
}
variable "logicalNetworkAddresses" {
  description = "Réseau logique du vnet"
}

variable "subnetName" {
  description = "Nom du subnet"
}

variable "logicalSubnetAddresses" {
  description = "Réseau logique du subnet"
}


# Variables pour la création du cluster AKS
variable "ClusterName" {
  description = "Nom du Cluster"
}

variable "ClusterVersion" {
  description = "Version du Cluster"
}

variable "clusterrolebindingGroup" {
  type = list
  description = "Groupe AD ayant droit de clusterrolebinding"
}

variable "PoolName" {
  description = "Nom du pool de nodes"
}

variable "NodeCount" {
  description = "Nombre de nodes"
}

variable "NodeSizeCompute" {
  description = "Taille des nodes"
}

variable "NodeSizeDisk" {
  description = "Taille du disque des nodes"
}


variable "ssh_public_key" {
  description = "Cle publique accédant aux nodes"
}

