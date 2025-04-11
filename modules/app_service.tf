resource "azurerm_app_service" "var.webapp_name" {
  name                = "var.webapp_name"
  location            = azurerm_resource_group.kishan.location
  resource_group_name = azurerm_resource_group.var.rgname
  app_service_plan_id = azurerm_app_service_plan.var.appservice_plan_name.id
  
  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

 
  }
