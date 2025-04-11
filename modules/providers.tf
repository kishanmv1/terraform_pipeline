terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "rg_terraform_pipelin"
    storage_account_name = "kishanstorageaccount123"
    container_name = "kishan"
    key = "terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}