# !/bin/bash
# CSI Installation – Variables Declaration
# Version : May 27, 2024
# Author : mariefdu45@gmail.com
#
# These are azurerm and kubernetes providers versions used for this demo
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.104.2"
    }
     kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }
  }
# This is minimal version of terraform
  required_version = ">= " v1.8.3"
}

