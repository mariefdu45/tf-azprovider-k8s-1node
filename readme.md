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


