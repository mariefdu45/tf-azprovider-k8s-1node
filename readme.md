# !/bin/bash
# CSI Installation – Variables Declaration
# Version : May 27, 2024
# Author : mariefdu45@gmail.com
#

Pré-requis: Installer le git client ainsi que Terraform dans une version supérieure à 1.2.9

Installation:
  Etape 1: Récupérer le contenu du répertoire avec la commande  git clone https://github.com/mariefdu45/tf-azprovider.git. Déplacer vous dans le répertoire tf-azprovider

  Etape 2: se connecter à Azure

    Solution 1 : se connecter avec az login et un utilisateur ayant droit.

    Solution 2 : Ne pas se connecter avec az login mais utiliser un Service principal (app/id ou app/certificat). Exporter des variables ARM_
    export ARM_TENANT_ID="*******************"
    export ARM_SUBSCRIPTION_ID="*******************"
    export ARM_CLIENT_ID="*******************"
    export ARM_CLIENT_SECRET="*******************"

    Solution 3 : Ne pas se connecter avec az login mais utiliser un Service principal (app/id ou app/certificat).Déclarer les variables en les spécifiant dans le module azurerm de main.tf
    provider "azurerm" {
      features {}
      tenant_id                   = "*******************"
      subscription_id             = "*******************"
      client_id                   = "*******************"
      client_secret               = "*******************"
    }


  Etape 3: Renseignez le fichier de variable terraform.tfvars

Utilisation:
Utiliser terraform (non documenté ici)


# tf-azurerm-aks
This repository is for installing a Kubernetes cluster on Azure (AKS) in an Infrastructure as code way (IaC), using Terraform. 

> Ce dépot a pour but d'installer un cluster Kubernetes sur Azure de manière automatisée (Infrastructure as code way ou IaC) en utilisant Terraform pour cela.

## Installing a cluster from scratch
### Prerequisite
- An Azure Subscription, associated to an tenant

Go to your favorite projects directory
```bash
cd <projects directory>
```

### Get Files
```bash
# Get kubernetes-cluster repository
git clone https://github.com/mariefdu45/tf-azurerm-aks.git
cd tf-azurerm-aks
cp templates_env/provider.tf .
cp templates_env/terraform.tfvars .
```

### Customizing .provider.tf with your own values to access azure
### Customizing .terraform.tfvars with your own values for your target cluster


## Configuring providers
```terraform init
```
### Get Files. In this case, you don't need variables.env
```bash

# Get kubernetes-cluster repository
git clone https://github.com/mariefdu45/kubernetes-cluster.git
cd kubernetes-cluster # it will be working_dir variable later
cp templates_env/terraform.tfvars vms_creation_tf/
```

### Customizing  vms_creation_tf/terraform.tfvars for creating virtual machines with your own values
- vcenter, admin user and password
- datacenter, datastore, cluster, network
- vm template, vm folder, network parameters for nodes
- masters and workers  properties

### execute bash script 
```bash
./vms_creation_tf/main.sh install
```

## Configuring kubernetes cluster on existing virtual machines
Go to your favorite projects directory
```bash
cd <projects directory>
```

### Get Files. In this case, you don't need terraform.tfvars but you need extra files describing your infrastructure

```bash
# Get kubernetes-cluster repository
git clone https://github.com/mariefdu45/kubernetes-cluster.git
cd kubernetes-cluster # it will be working_dir variable later
cp templates_env/variables.env .
cp templates_env/.masters_list_var.env .
cp templates_env/.workers_list_var.env .
cp templates_env/.masters_var.env .
cp templates_env/.workers_var.env .

### Customizing  variables.env for creating kubernetes cluster with your own values
- kubespray branch
- sudo user name and password configured in the template
- cluster name
- cni of your choice

### Customizing  files  describing your existing infrastructure (names and ips)
- .masters_list_var.env
- .workers_list_var.env
- .masters_var.env
- .workers_var.env

### execute bash script 
```bash
./cluster_creation_kubespray/main.sh install
```


## Uninstalling vms and cluster if configured
```bash
./main.sh uninstall
```

## Uninstalling cluster only
```bash
./cluster_creation_kubespray/main.sh uninstall uninstall
```

