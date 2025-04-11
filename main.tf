provider "azurerm" {
  features {}
  subscription_id = var.subscription_id 
} 

module "resource_group" {
  source = "./modules/resource_group"
  rgname = var.rgname
  location = var.location
}

data "appserviceplan" "appserviceplan" {
  name = var.aspname
  location = var.location
  resource_group_name = module.resource_group.rgname 
}

module "app_service" {
  source = "./modules/app_service"
  webapp_name = var.webapp_name
  location = var.location
  rgname = module.resource_group.rgname 
  appservice_plan_name = data.appserviceplan.appserviceplan.id
  
}