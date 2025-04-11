terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "rg_terraform_pipeline"
    storage_account_name = "kishanstorageaccount123"
    container_name = "kishan"
    key = "terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  
}
module "resource_group" {
  source = "./modules"
  rgname = var.rgname
  location = var.location
  subscription_id = var.subscription_id
 
  
}
data "azurerm_app_service_plan" "kishan_plan" {
  name                = var.aspname
  location            = var.location
  resource_group_name = azurerm_resource_group.kishan.name
  
}

module "app_service" {
  source = "./modules"
  rgname = var.rgname
  location = var.location
  aspname = var.aspname
  size = var.size
  subscription_id = var.subscription_id

  
}

