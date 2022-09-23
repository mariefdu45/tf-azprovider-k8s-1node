variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "rgName" {
  description = "Nom du resource Group"
}

variable "location" {
  description = "Emplacement des ressources"
}

variable "rgTag_environnement" {
  description = "Tag environnement"
}

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



