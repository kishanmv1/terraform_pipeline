terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "rg_terraform_pipeline"
   container_name = "kishan"
    key = "terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = "9666140b-b7a7-4d21-af05-8d51145d043f"
}
resource "azurerm_resource_group" "kishan" {
  name     = var.rgname
  location = var.location
}
resource "azurerm_app_service_plan" "kishan_plan" {
  name                = var.aspname
  location            = var.location
  resource_group_name = azurerm_resource_group.kishan.name

  sku {
    tier = "Standard"
    size = var.size
  }
}
#resource "azurerm_app_service" "kishan" {
 # name                = "kishanwebapp"
  #location            = azurerm_resource_group.kishan.location
  #resource_group_name = azurerm_resource_group.kishan.name
  #app_service_plan_id = "/subscriptions/9666140b-b7a7-4d21-af05-8d51145d043f/resourceGroups/rg_terraform/providers/Microsoft.Web/serverFarms/kishan-appserviceplan"
  
  #site_config {
   # dotnet_framework_version = "v4.0"
    #scm_type                 = "LocalGit"
  #}

 
  #}
