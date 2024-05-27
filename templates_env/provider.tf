# !/bin/bash
# CSI Installation – Variables Declaration
# Version : May 27, 2024
# Author : mariefdu45@gmail.com
#
provider "azurerm" {
  features {}
# tenant_id and subscription_id are enought when you first login in azure
  tenant_id                   = "************************************"
  subscription_id             = "************************************"
# Service principal is prefered method for use with code
  client_id                   = "************************************"
  client_secret               = "************************************"
}

