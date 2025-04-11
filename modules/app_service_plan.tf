resource "azurerm_app_service_plan" "var.appservice_plan_name" {
  name                = var.aspname
  location            = var.location
  resource_group_name = azurerm_resource_group.kishan.name

  sku {
    tier = "Standard"
    size = var.size
  }
}